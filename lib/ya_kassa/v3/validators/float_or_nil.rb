module YaKassa
  module V3
    module Validators
      class FloatOrNil < Base
        private

        def condition
          value.is_a?(Float) || value.nil?
        end

        def error_msg
          "Should be present"
        end
      end
    end
  end
end
