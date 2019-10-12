module YaKassa
  module V3
    class RefundRequest < BaseRequest
      attributable :amount_value
      attributable :amount_currency, default: "RUB"
      attributable :payment_id

      validatable :amount_value, :is_a, class: 'Float'
      validatable :amount_currency, :present
      validatable :payment_id, :present

      def body
        {
          payment_id: payment_id,
          amount: {
            value: amount_value,
            currency: amount_currency
          }
        }
      end

      private

      def api_client
        api_client_post
      end

      def url
        router.refund_url
      end

      def class_validator
        'RefundRequest'
      end
    end
  end
end
