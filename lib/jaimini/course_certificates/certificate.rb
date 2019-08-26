# frozen_string_literal: true

module Jaimini
	module CourseCertificates

		class Certificate < Jaimini::CourseCertificates::Record

			SCHEMA =  Dry::Schema.define do
									required(:course).filled(:hash)
									required(:issued_on).filled(:date)
									required(:uid).filled(:string)
									required(:url).filled(:string)
									required(:user).filled(:hash)
								end

			def initialize(certificate_params)
				@params = certificate_params.transform_keys { |key| key.to_sym rescue key }
				@course = Jaimini::CourseCertificates::Course.new @params[:course]
				@user   = Jaimini::CourseCertificates::User.new   @params[:user]
				validate! @params
			end

			def course
				@course
			end

			def issued_on
				@params[:issued_on]
			end

			def uid
				@params[:uid]
			end

			def url
				@params[:url]
			end

			def user
				@user
			end

		end

	end
end
