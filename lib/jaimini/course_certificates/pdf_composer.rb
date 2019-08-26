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

      def initialize(meta:, bg_image: nil, bg_dpi: 300)
        @meta     = meta
        @bg_image = bg_image
        @bg_dpi   = bg_dpi
        validate!
      end

      def call
        pdf = Prawn::Document.new(
          background:       @bg_image,
          background_scale: bg_scale,
          info:             @meta,
          page_layout:      :portrait,
          page_size:        "A5"
        )
        pdf.text "Hello World"
        pdf.move_down 5.mm
        # pdf.font("/myfont.ttf")

        pdf.encrypt_document(owner_password: :random, permissions: PERMISSIONS)

        return pdf
      end

      private

      def bg_scale
        RESOLUTION / @bg_dpi.to_f
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
