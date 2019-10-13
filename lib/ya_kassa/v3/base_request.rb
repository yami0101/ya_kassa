module YaKassa
  module V3
    class BaseRequest
      extend Concerns::Attributable
      include Concerns::Validatable

      attr_reader :response

      def initialize(idempotence_key, params = {})
        @params = params
        @idempotence_key = idempotence_key
        @response = nil
      end

      def create
        return errors unless valid?
        send_request
      end

      def body
        { }
      end

      private

      def send_request
        resp = api_client.request
        raise resp.inspect unless resp[:body].present?
        @response = JSON.parse(resp[:body])
      end

      def api_client_post
        Client::Post.new(url, body.to_json, @idempotence_key)
      end

      def api_client_get
        Client::Get.new(router.payment_status_url)
      end

      def api_client
        raise 'Method not implemented'
      end

      def url
        raise 'Method not implemented'
      end

      def router
        Router.new(payment_id: @params[:payment_id])
      end
    end
  end
end
