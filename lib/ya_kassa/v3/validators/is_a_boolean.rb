module YaKassa
  module V3
    module Validators
      class IsABoolean < Base
        private

        def condition
          value.is_a?(TrueClass) || value.is_a?(FalseClass)
        end

        def error_msg
          "Should be Boolean"
        end
      end
    end
  end
end
