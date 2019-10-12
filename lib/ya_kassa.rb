require "httparty"
require "ya_kassa/version"

puts HTTParty.inspect

module YaKassa
  require 'ya_kassa/v3/utilites/string'
  require 'ya_kassa/v3/client/base'
  require 'ya_kassa/v3/client/get'
  require 'ya_kassa/v3/client/post'
  require 'ya_kassa/v3/validators/base'
  require 'ya_kassa/v3/validators/float_or_nil'
  require 'ya_kassa/v3/validators/is_a'
  require 'ya_kassa/v3/validators/is_a_boolean'
  require 'ya_kassa/v3/validators/present'
  require 'ya_kassa/v3/concerns/attributable'
  require 'ya_kassa/v3/concerns/validatable'
  require 'ya_kassa/v3/base_request'
#  require 'ya_kassa/v3/base_response'
#  require 'ya_kassa/v3/payment_cancel_request'
#  require 'ya_kassa/v3/payment_capture_request'
  require 'ya_kassa/v3/payment_request'
#  require 'ya_kassa/v3/payment_response'
#  require 'ya_kassa/v3/payment_status_request'
#  require 'ya_kassa/v3/receipt_request'
#  require 'ya_kassa/v3/receipt_response'
#  require 'ya_kassa/v3/refund_request'
#  require 'ya_kassa/v3/refund_response'
  require 'ya_kassa/v3/router'
end
