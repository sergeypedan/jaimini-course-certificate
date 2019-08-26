# frozen_string_literal: true

module Jaimini
	module CourseCertificates

		class Course < Jaimini::CourseCertificates::Record

			KEYS = %i[title slug]

			SCHEMA = Dry::Schema.Params do
									# required(:id).value(:integer, gt?: 0)
									required(:title).filled(:string)
									required(:slug).filled(:string)
								end

		end

	end
end
