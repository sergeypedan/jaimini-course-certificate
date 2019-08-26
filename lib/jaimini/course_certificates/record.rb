# frozen_string_literal: true

module Jaimini
	module CourseCertificates

		class Record

			KEYS = %i[] # in children

			SCHEMA = Dry::Schema.Params do
							 end

			# in children
			# KEYS.each do |key|
			#   define_method(key) do @params[key] end
			# end

			self::KEYS.each do |key|
				define_method(key) do @params[key] end
			end

			def initialize(params)
				@params = params.transform_keys { |key| key.to_sym rescue key }
				validate! @params
			end

			attr_reader :errors
      def valid?; @valid end

			def validate!(params)
				validation = self.class::SCHEMA.call params
				@valid     = validation.success?
				@errors    = validation.errors
				return validation.success?
			end

		end
	end
end
