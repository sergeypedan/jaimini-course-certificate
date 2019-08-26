# frozen_string_literal: true

module Jaimini
	module CourseCertificates

		class Certificate < Jaimini::CourseCertificates::Record

			KEYS = %i[uid issued_on]

			SCHEMA = Dry::Schema.Params do
									required(:uid).filled(:string)
									required(:issued_on).value(:date)
								end

			KEYS.each do |key|
				define_method(key) do @params[key] end
			end

		end

	end
end
