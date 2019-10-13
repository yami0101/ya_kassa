module YaKassa
  module V3
    module Concerns
      module Validatable
        VALIDATORS = {
          present: 'Present',
          is_a: "IsA",
          is_a_boolean: 'IsABoolean',
          float_or_nil: 'FloatOrNil'
        }

        module ClassMethods
          def validatable(name, type, params = {})
            validators = get_validators
            validators << { name: name, type: type, params: params }
            class_variable_set(:@@validators, validators)
          end

          private

          def get_validators
            begin
              class_variable_get(:@@validators)
            rescue NameError
              []
            end
          end
        end

        def self.included(klass)
          klass.extend(ClassMethods)
        end

        def valid?
          @errors = {}
          valid_arr = validators.map do |opts|
            validator = create_validator(opts)
            validator.validate
            collect_errors(validator)
            validator.valid?
          end
          valid_arr.select { |v| v == false }.empty?
        end

        def errors
          @errors.select { |k, v| v.any? }
        end

        private

        def create_validator(opts)
          validator = validator_class(opts[:type]).new(
            opts[:name],
            attr_value(opts[:name]),
            opts[:params]
          )
        end

        def validators
          begin
            self.class.class_variable_get(:@@validators)
          rescue NameError
            []
          end
        end

        def attr_value(attr_name)
          self.public_send(attr_name)
        end

        def collect_errors(validator)
          @errors[validator.name] ||= []
          @errors[validator.name] << validator.error
        end

        def validator_class(type)
          klass = VALIDATORS[type]
          Utilites::String.constantize("::YaKassa::V3::Validators::#{klass}")
        end
      end
    end
  end
end
