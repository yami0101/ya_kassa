module YaKassa
  module V3
    module Client
      class Base
        attr_reader :url, :body, :idempotence_key

        def initialize(url, body = nil, idempotence_key = nil)
          @url = url
          @body = body
          @idempotence_key = idempotence_key
        end

        def request
          response = send
          { code: response.code, body: response_body(response), headers: response.headers}
        end

        protected

        def response_body(response)
          response.body
        end

        def send
          raise 'Not implemented method'
        end

        def auth
          { username: shop_id, password: secret_key } 
        end

        def idempotence?
          @idempotence_key.present?
        end

        def headers
          {
            'Content-Type' => 'application/json',
            'Idempotence-Key' => @idempotence_key
          }
        end

        private

        def shop_id
          ::YaKassa::V3::Settings.shop_id
        end

        def secret_key
          ::YaKassa::V3::Settings.secret_key
        end
      end
    end
  end
end
