module YaKassa
  module V3
    class Router
      ENDPOINT='https://payment.yandex.net/api/v3/'
      PATH = {
        payments: 'payments',
        refunds: 'refunds',
        receipts: 'receipts'
      }
      
      def initialize(params = {})
        @params = params
      end

      def payment_url
        "#{ENDPOINT}#{PATH[:payments]}"
      end

      def payment_status_url
        "#{ENDPOINT}#{PATH[:payments]}/#{@params[:payment_id]}"
      end

      def payment_confirmation_url
        "#{ENDPOINT}#{PATH[:payments]}/#{@params[:payment_id]}/capture"
      end

      def payment_cancel_url
        "#{ENDPOINT}#{PATH[:payments]}/#{@params[:payment_id]}/cancel"
      end

      def refund_url
        "#{ENDPOINT}#{PATH[:refunds]}"
      end

      def receipt_url
        "#{ENDPOINT}#{PATH[:receipts]}"
      end
    end
  end
end
