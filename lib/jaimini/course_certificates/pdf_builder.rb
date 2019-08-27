# frozen_string_literal: true

require "pry"

module Jaimini
	module CourseCertificates
		class PDFBuilder

      # include DryHelpers

			def initialize(certificate:, pdf_meta:, background: { dpi: 300 })
				validate_initial!(certificate)
				@certificate = Jaimini::CourseCertificates::Certificate.new(certificate)
				@pdf_meta    = pdf_meta
				@background  = background
        @background[:image] = File.expand_path('../../../../assets/images/background.jpg', __FILE__) unless @background[:image]
        validate!
			end

			def save_as_file(path: "certificate.pdf")
				prawn_doc.render_file path
			end

			def stream
				prawn_doc.render
			end

			def prawn_doc
				@prawn_doc ||= composer.call
			end

			def composer
				@composer ||= PDFComposer.new(
          certificate: @certificate,
					meta:        @pdf_meta,
					bg_image:    @background[:image],
					bg_dpi:      @background[:dpi]
				)
			end

			private

      def validate_initial!(certificate)
        fail ArgumentError, "`certificate` must not be nil" unless certificate
      end

			def validate!
				fail ArgumentError, "`certificate` must be a Jaimini::CourseCertificates::Certificate — you pass '#{@certificate.inspect}' (#{@certificate.class})" unless @certificate.is_a? Jaimini::CourseCertificates::Certificate
				# fail ArgumentError, @certificate.errors.messages.map { |message| dry_message(message) } unless @certificate.valid?
        fail ArgumentError, @certificate.errors.to_h.inspect unless @certificate.valid?
			end

		end

	end

end

