module YaKassa
  module V3
    class PaymentCancelRequest < BaseRequest
      private

      def api_client
        api_client_post
      end

      def url
        router.payment_cancel_url
      end
    end
  end
end
