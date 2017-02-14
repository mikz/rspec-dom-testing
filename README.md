# RSpec::Dom::Testing [![Build Status](https://travis-ci.org/mikz/rspec-dom-testing.svg?branch=master)](https://travis-ci.org/mikz/rspec-dom-testing)

This gem wraps [`rails-dom-testing`](https://github.com/rails/rails-dom-testing) helpers as RSpec Matchers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-dom-testing', group: :test
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-dom-testing
## Usage

First include the matchers into RSpec:

```ruby
RSpec.configure do |config|
  config.include RSpec::Dom::Testing::Matchers
end
```

Then use them:

```ruby
RSpec.describe 'matchers' do
  it { expect('<li>text</li>').to have_tag('li', text: 'text') }
  it { expect('<p>example</p>').to have_text(text: 'example') }
end
```

For all available options check [rails-dom-testing documentation](http://www.rubydoc.info/gems/rails-dom-testing/Rails/Dom/Testing/Assertions/SelectorAssertions#assert_select-instance_method).

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mikz/rspec-dom-testing
