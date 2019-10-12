module YaKassa
  module V3
    class BaseResponse
      extend Concerns::Attributable

      attr_reader :params

      def initialize(params = {})
        @params = params
      end
    end
  end
end
