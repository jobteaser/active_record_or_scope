# ActiveRecordOrScope

[![Build Status](https://travis-ci.org/jobteaser/active_record_or_scope.svg?branch=master)](https://travis-ci.org/jobteaser/active_record_or_scope)
[![Code Climate](https://codeclimate.com/repos/58667f4a7b31a36aa70043b2/badges/2a5ab1c24ec5e2c9cb55/gpa.svg)](https://codeclimate.com/repos/58667f4a7b31a36aa70043b2/feed)

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jobteaser/active_record_or_scope.
