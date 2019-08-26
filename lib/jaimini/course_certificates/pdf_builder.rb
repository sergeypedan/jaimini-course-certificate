# frozen_string_literal: true

module Jaimini
	module CourseCertificates
		class PDFBuilder

			def initialize(certificate:, course:, user:, pdf_meta:, background: { dpi: 300 })
				@certificate = Jaimini::CourseCertificates::Certificate.new(certificate)
				@course      = Jaimini::CourseCertificates::Course.new(course)
				@user        = Jaimini::CourseCertificates::User.new(user)
				@pdf_meta    = pdf_meta
				@background  = background
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
					meta:     @pdf_meta,
					bg_image: @background[:image],
					bg_dpi:   @background[:dpi]
				)
			end

			private

			def validate!
				fail ArgumentError, "`certificate` must be a Jaimini::CourseCertificates::Certificate — you pass '#{@certificate.inspect}' (#{@certificate.class})" unless @certificate.is_a? Jaimini::CourseCertificates::Certificate
				fail ArgumentError, "`course` must be a Jaimini::CourseCertificates::Course — you pass '#{@course.inspect}' (#{@course.class})" unless @course.is_a? Jaimini::CourseCertificates::Course
				fail ArgumentError, "`user` must be a Jaimini::CourseCertificates::User — you pass '#{@user.inspect}' (#{@user.class})" unless @user.is_a? Jaimini::CourseCertificates::User
				fail ArgumentError, @certificate.errors unless @certificate.valid?
				fail ArgumentError, @course.errors      unless @course.valid?
				fail ArgumentError, @user.errors        unless @user.valid?
			end

		end

	end

end

