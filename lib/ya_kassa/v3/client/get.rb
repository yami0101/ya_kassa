module YaKassa
  module V3
    module Client
      class Get < Base
        protected

        def response_body(response)
          begin
            JSON.parse(response.body)
          rescue JSON::ParserError
            response.body
          end
        end

        def send
          ::HTTParty.get(@url, basic_auth: auth)
        end
      end
    end
  end
end
