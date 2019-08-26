# frozen_string_literal: true

module Jaimini
	module CourseCertificates

		class User < Jaimini::CourseCertificates::Record

			KEYS = %i[first_name last_name gender]

			SCHEMA = Dry::Schema.define do
									required(:first_name).filled(:string)
									required(:last_name).filled(:string)
                  required(:gender).filled(:string)
								end

      KEYS.each do |key|
        define_method(key) do @params[key] end
      end
		end

	end
end
