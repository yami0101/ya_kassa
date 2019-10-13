# YaKassa

Обёртка для работы с API V3 сервиса ЯндексКасса(YandexKassa)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ya_kassa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ya_kassa

Create initializer file like this
```
# /config/initializers/ya_kassa.rb

YaKassa::V3::Settings.shop_id = Rails.application.credentials[:ya_kassa][:shop_id]
YaKassa::V3::Settings.secret_key = Rails.application.credentials[:ya_kassa][:secret_key]

```

## Example of Usage
#### Payment
```
idempotence_key = '123456'

payment_params = {
  amount_value: 10.0,
  payment_id: '123',
  return_url: 'http://example.com'
}

YaKassa::V3::PaymentRequest.new(idempotence_key, payment_params).create
# => {"id"=>"2534fac6-000f-5000-a000-105ab7c0ab90", "status"=>"pending", "paid"=>false, "amount"=>{"value"=>"10.00", "currency"=>"RUB"}, "confirmation"=>{"type"=>"redirect", "confirmation_url"=>"https://money.yandex.ru/api-pages/v2/payment-confirm/epl?orderId=2534fac6-000f-50....."}, "created_at"=>"2019-10-13T08:57:42.987Z", "metadata"=>{}, "recipient"=>{"account_id"=>"123123", "gateway_id"=>"123123"}, "refundable"=>false, "test"=>true}
```

#### Payment status
```
YaKassa::V3::PaymentStatusRequest.new('2534fac6-000f-5000-a000-105ab7c0ab90').create
# => {"id"=>"2534fac6-000f-5000-a000-105ab7c0ab90", "status"=>"pending", "paid"=>false, "amount"=>{"value"=>"10.00", "currency"=>"RUB"}, "confirmation"=>{"type"=>"redirect", "confirmation_url"=>"https://money.yandex.ru/api-pages/v2/payment-confirm/epl?orderId=2534fac6-000f..."}, "created_at"=>"2019-10-13T08:57:42.987Z", "metadata"=>{}, "recipient"=>{"account_id"=>"123123", "gateway_id"=>"123123"}, "refundable"=>false, "test"=>true}
```

### Validation
```
idempotence_key = '123456'

payment_params = {
  payment_id: '123',
  return_url: 'http://example.com'
}

YaKassa::V3::PaymentRequest.new(idempotence_key, payment_params).create
#=> {:amount_value=>["Should be Float"]}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ya_kassa. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the YaKassa project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ya_kassa/blob/master/CODE_OF_CONDUCT.md).
