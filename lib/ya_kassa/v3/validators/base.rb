module YaKassa
  module V3
    module Validators
      class Base
        attr_reader :error, :name, :value

        def initialize(name, value, params = {})
          @name = name
          @value = value
          @params = params
          @error = nil
          @is_validated = false
        end

        def validate
          @error = error_msg unless condition
          @is_validated = true
          nil
        end

        def valid?
          unless @is_validated
            msg = "#{self.class.name}. Need to run #validate method before call #valid?"
            Rails.logger.info(msg)
            return nil
          end
          @error.blank?
        end

        private

        def not_implemented_method
          raise 'Method is not implemented'
        end

        def condition
          not_implemented_method
        end

        def error_msg
          not_implemented_method
        end
      end
    end
  end
end
