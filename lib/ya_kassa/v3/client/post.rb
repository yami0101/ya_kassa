module YaKassa
  module V3
    module Client
      class Post < Base
        protected

        def send
          ::HTTParty.post(@url, body: @body, headers: headers, basic_auth: auth)
        end
      end
    end
  end
end
