module YaKassa
  module V3
    module Validators
      class IsA < Base
        private

        def condition
          value.is_a?(is_a_class)
        end

        def error_msg
          "Should be #{is_a_class}"
        end

        def is_a_class
          Utilites::String.constantize(@params[:class])
        end
      end
    end
  end
end
