module YaKassa
  module V3
    class PaymentStatusRequest < BaseRequest
      def initialize(payment_id)
        @payment_id = payment_id
      end

      def create
        @response = api_client.request[:body]
      end
      
      private

      def api_client
        api_client_get
      end

      def router
        Router.new(payment_id: @payment_id)
      end
    end
  end
end
