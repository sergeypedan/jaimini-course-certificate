# frozen_string_literal: true

module Jaimini
	module CourseCertificates

		class Course < Jaimini::CourseCertificates::Record

			SCHEMA = Dry::Schema.define do
									required(:title).filled(:string)
									required(:url).filled(:string)
								end

      def title
        @params[:title].gsub("«", "„").gsub("»", "“")
      end

      def url
        @params[:url]
      end

		end

	end
end
