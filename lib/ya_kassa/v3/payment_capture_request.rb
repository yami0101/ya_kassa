module YaKassa
  module V3
    class PaymentCaptureRequest < BaseRequest
      attributable :amount_value
      attributable :amount_currency, default: "RUB"

      validatable :amount_value, :present
      validatable :amount_currency, :present

      def body
        res = nil
        if amount_value && amount_currency
          res = {
            amount: {
              value: amount_value,
              currency: amount_currency
            }
          }
        end
        res
      end

      private

      def api_client
        api_client_post
      end

      def url
        router.payment_confirmation_url
      end
    end
  end
end
