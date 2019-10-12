module YaKassa
  module V3
    class ReceiptResponse < BaseResponse
      include Concerns::Attributable

      attributable :id, default: 1
    end
  end
end
