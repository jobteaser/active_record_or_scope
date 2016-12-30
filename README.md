# ActiveRecordOrScope

This gem allows chaining ActiveRecord scopes with OR instead of the default AND

The implementation is stolen from https://coderwall.com/p/lsdnsw/chain-rails-scopes-with-or

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record_or_scope'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record_or_scope

## Usage

```ruby
users = User.where_any(
  User.where(name: "Bob"),
  User.where(name: "Bobby"),
  User.where(name: "Bobbie")
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_record_or_scope.
