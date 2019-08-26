# frozen_string_literal: true

module Jaimini
	module CourseCertificates

		class User < Jaimini::CourseCertificates::Record

			KEYS = %i[first_name last_name]

			SCHEMA = Dry::Schema.Params do
									# required(:id).value(:integer, gt?: 0)
									required(:first_name).filled(:string)
									required(:last_name).filled(:string)
								end

		end

	end
end
