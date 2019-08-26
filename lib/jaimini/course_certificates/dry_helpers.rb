# frozen_string_literal: true

module Jaimini
  module CourseCertificates
    module DryHelpers
      def dry_message(message)
        "#{message.path} #{message.text}"
        # errors.to_h.inspect
      end
    end
  end
end
