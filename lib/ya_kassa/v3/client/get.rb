module YaKassa
  module V3
    module Client
      class Get < Base
        protected

        def response_body(response)
          JSON.parse(response.body)
        end

        def send
          HTTParty.get(@url, basic_auth: auth)
        end
      end
    end
  end
end
