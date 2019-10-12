module YaKassa
  module V3
    class PaymentResponse < BaseResponse
      attributable :id
      attributable :status
      attributable :amount
      attributable :created_at
      attributable :payment_id
      attributable :requestor
    end
  end
end
