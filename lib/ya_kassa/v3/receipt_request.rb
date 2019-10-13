module YaKassa
  module V3
    class ReceiptRequest < BaseRequest
     attributable :customer
      attributable :payment_id
      attributable :type, default: "payment"
      attributable :send, default: "true"
      attributable :items
      attributable :full_name
      attributable :email
      attributable :phone
      attributable :inn
      attributable :vat_code, default: "2" # НДС "2" == 0%
      attributable :currency, default: "RUB"
      attributable :payment_mode, default: "full_payment"
      attributable :payment_type, default: "prepayment"

      validatable :payment_id, :is_a, class: "String"
      validatable :type, :present
      validatable :send, :present
      validatable :items, :is_a, class: 'Array'
      validatable :full_name, :is_a, class: "String"
      validatable :email, :is_a, class: "String"
      validatable :phone, :present
      validatable :inn, :present

      def body
        {
          customer: body_customer,
          payment_id: payment_id,
          type: type,
          send: send,
          items: body_items,
          settlements: settlements_body
        }
      end

      protected

      def body_customer
        body = {
          full_name: full_name,
          email: email,
          phone: phone
        }
        body[:inn] = inn if inn
        body
      end

      def body_items
        items.map do |item|
          {
            description: item[:description],
            quantity: item[:quantity],
            amount: {
              value: item[:amount_value],
              currency: currency
            },
            vat_code: vat_code,
            payment_mode: payment_mode
          }
        end
      end

      def settlements_body
        items.map do |item|
          {
            type: payment_type,
            amount: {
              value: item[:amount_value],
              currency: currency
            }
          }
        end
      end

      private

      def api_client
        api_client_post
      end

      def url
        router.receipt_url
      end
    end
  end
end
