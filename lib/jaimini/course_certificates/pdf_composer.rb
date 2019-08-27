# frozen_string_literal: true

require "prawn"
require "prawn/measurement_extensions"

module Jaimini
  module CourseCertificates
    class PDFComposer

      PERMISSIONS = {
        copy_contents:      false,
        modify_annotations: false,
        modify_contents:    false,
        print_document:     true
      }

      RESOLUTION = 72

      FONT_SIZE = {
        xlarge: 22,
        large:  18,
        normal: 13,
        small:  8,
        xsmall: 6
      }

      FONTS = {
        gentium: {
          regular: File.expand_path('../../../../assets/fonts/GentiumPlus-R.ttf', __FILE__)
        }
      }


      def initialize(certificate:, meta:, bg_image: nil, bg_dpi: 300)
        @certificate = certificate
        @course      = certificate.course
        @user        = certificate.user
        @meta        = meta
        @bg_dpi      = bg_dpi
        @bg_image    = bg_image
        validate!
      end

      def call
        pdf = Prawn::Document.new(
          background:       @bg_image,
          background_scale: bg_scale,
          info:             @meta,
          margin:           2.2.cm,
          top_margin:       5.cm,
          page_layout:      :portrait,
          page_size:        "A5"
        )

        pdf.font FONTS[:gentium][:regular]

        pdf.font_size 26
        pdf.text "Сертификат",
                  align: :center, kerning: true

        pdf.font_size 10
        pdf.text "№ #{@certificate.uid}",
                  align: :center, kerning: true

        pdf.move_down 5.mm
        pdf.font_size FONT_SIZE[:normal]
        pdf.text "удостоверяет, что",
                  align: :center, kerning: true

        pdf.font_size FONT_SIZE[:xlarge]
        pdf.text "#{@user.first_name} #{@user.last_name}",
                  align: :center, kerning: true

        pdf.move_down 3.mm
        pdf.font_size FONT_SIZE[:normal]
        pdf.text "успешно #{@user.gender == "male" ? "прошёл" : "прошла"} курс",
                  align: :center, kerning: true

        pdf.font_size FONT_SIZE[:large]
        pdf.text "«#{@course.title}»",
                  align: :center, kerning: true, leading: -5

        pdf.move_down 2.mm
        pdf.font_size FONT_SIZE[:normal]
        pdf.text "в школе ведической астрологии",
                  align: :center, kerning: true

        pdf.font_size FONT_SIZE[:large]
        pdf.text "<link href=\"https://jaimini.ru\">Jaimini</a>",
                  align: :center, kerning: true, inline_format: true

        pdf.move_down 7.mm
        pdf.font_size FONT_SIZE[:normal]
        pdf.text "Сертификат выдан #{l_date}",
                  align: :center, kerning: true

        pdf.move_down 3.mm
        pdf.font_size FONT_SIZE[:xsmall]
        pdf.line_width = 0.3
        pdf.text "Онлайн-версия сертификата находится по адресу\n<link href=\"#{@certificate.url}\">#{@certificate.url}</link>",
                  align: :center, kerning: true, inline_format: true

        pdf.encrypt_document(owner_password: :random, permissions: PERMISSIONS)

        return pdf
      end

      private

      def bg_scale
        RESOLUTION / @bg_dpi.to_f
      end

      def l_date
        [
          @certificate.issued_on.day,
          l_month(@certificate.issued_on.month),
          @certificate.issued_on.year
        ].join(" ")
      end

      def l_month(month_number)
        Jaimini::CourseCertificates::MonthsLocalization.month_name(month_number, noun_case: :genitive)
      end

      def validate!
        fail ArgumentError, "background DPI must be a Numeric" unless @bg_dpi.is_a? Numeric
        fail ArgumentError, "background DPI must be positive" unless @bg_dpi.positive?
        fail ArgumentError, "background image must be a String" unless @bg_image.is_a? String
        fail ArgumentError, "meta must be a Hash" unless @meta.is_a? Hash
      end

    end
  end
end
