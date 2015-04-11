# Probability

Implementation of probability: represents likelyhood of some event happening

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'probability'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install probability

## Usage

### Creating a probability

```ruby
probability = Probability.new 0.78
```

### Logical operations with probability

```ruby
probability1 = Probability.new 0.06
probability2 = Probability.new 0.13

probability1.and probability2        #=> #<Probability: 0.0078>
probability1.or probability2         #=> #<Probability: 0.1822>
probability1.not                     #=> #<Probability: 0.94>
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/d-ark/probability/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
