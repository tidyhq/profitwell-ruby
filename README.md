# Profitwell

A Ruby toolkit for the [Profitwell](http://home.profitwell.com/) Transactions API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'profitwell-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install profitwell-ruby

## Usage

Calls for the Profitwell API are relative to the base url
`https://api.profitwell.com/v1/`

API actions are available as methods on the client object. Currently, the
Profitwell client has the following methods:

| Action               	               | Method             					                                                    |
|:-------------------------------------|:---------------------------------------------------------------------------------|
| **Transactions**                     |                        					                                                |
| Retrieve all transaction data        | `#transactions`                                                                  |
| Post a new subscription customer     | `#new_customer(email, plan_name, plan_interval, plan_value, start_date, options={})` |
| **Transaction Details**              |
| Retrieve all transactions for a user | `#transaction_detail(user_id)`                                                   |
| Update existing user's subscription  | `#update_subscription(user_id, plan_name, plan_interval, plan_value, start_date)`|
| Delete existing user's subscription  | `#delete_user(user_id)`                                                          |

## Usage Examples

**Authentication**

First grab your API_KEY found in [your account settings](https://www.profitwell.com/app/account/integrations) and initialize a new client.

After that, you can integrate with other services.

```ruby
require "profitwell"

API_KEY = "<your_api_key>"

profitwell_client = Profitwell::Client.new(API_KEY)
```

Here are some common use cases for the Profitwell API client.

**You can retrieve all transaction data from your account.**

```ruby
profitwell_client.transactions

# =>
[
  {
    "user_id": "pwu_1OHgWo45JPuI",
    "subscription_id": "pws_J2ISBvWMP6Fs",
    "email": "superman@profitwell.com",
    "plan_name": "Clark Kent Premium",
    "plan_interval": "Month",
    "plan_value": 10,
    "currency": "usd",
    "start_date": "2015-08-27T06:00:00Z",
    "end_date": "2016-03-27T06:00:00Z",
    "is_pending_processing": false
  },
  {
    "user_id": "pwu_3lSKeiSlTyq",
    "subscription_id": "pws_xMIOLQ5iks8R",
    "email": "batman@profitwell.com",
    "plan_name": "Bruce Wayne Enterprise",
    "plan_interval": "Year",
    "plan_value": 120,
    "currency": "usd",
    "start_date": "2015-08-09T06:00:00Z",
    "end_date": null,
    "is_pending_processing": false
  }
]
```

**You can retrieve all transactions for a given user**

```ruby
profitwell_client.transaction_detail("pwu_3lSKeiSlTyq")

# =>
[
  {
    "user_id": "pwu_3lSKeiSlTyq",
    "subscription_id": "pws_xMIOLQ5iks8R",
    "email": "batman@profitwell.com",
    "plan_name": "Bruce Wayne Enterprise",
    "plan_interval": "Year",
    "plan_value": 120,
    "currency": "usd",
    "start_date": "2015-06-01T00:00:00Z",
    "end_date": "2015-06-15T00:00:00Z"
    "is_pending_processing": false
  },
  {
    "user_id": "pwu_3lSKeiSlTyq",
    "subscription_id": "pws_xMIOLQ5iks8R",
    "email": "batman@profitwell.com",
    "plan_name": "Bruce Wayne Enterprise",
    "plan_interval": "Year",
    "plan_value": 240,
    "currency": "usd",
    "start_date": "2015-06-15T00:00:00Z",
    "end_date": "2015-07-15T00:00:00Z",
    "is_pending_processing": false
  },
  {
    "user_id": "pwu_3lSKeiSlTyq",
    "subscription_id": "pws_xMIOLQ5iks8R",
    "email": "batman@profitwell.com",
    "plan_name": "Bruce Wayne Premium",
    "plan_interval": "Month",
    "plan_value": 50,
    "currency": "usd",
    "start_date": "2015-07-15T00:00:00Z",
    "end_date": "2015-10-01T00:00:00Z",
    "is_pending_processing": false
  },
  {
    "user_id": "pwu_3lSKeiSlTyq",
    "subscription_id": "pws_xMIOLQ5iks8R",
    "email": "batman@profitwell.com",
    "plan_name": "Bruce Wayne Premium",
    "plan_interval": "Month",
    "plan_value": 0,
    "currency": "usd",
    "start_date": "2015-10-01T00:00:00Z",
    "end_date": null,
    "is_pending_processing": false
  }
]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hookengine/profitwell. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

