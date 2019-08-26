# frozen_string_literal: true

module Jaimini
	module CourseCertificates

		class Certificate < Jaimini::CourseCertificates::Record

			KEYS = %i[uid issued_on]

			SCHEMA = Dry::Schema.Params do
									# required(:id).value(:integer, gt?: 0)
									required(:uid).filled(:string)
									required(:issued_on).value(:date)
								end

		end

	end
end
