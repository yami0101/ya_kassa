module YaKassa
  module V3
    module Validators
      class Present < Base
        private

        def condition
          value && value != ''
        end

        def error_msg
          "Should be present"
        end
      end
    end
  end
end
