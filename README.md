# ProcParty

Ever had a class with just one method? Maybe it was named `#call` or `#process`?

Ever wanted to `(1..3).map(&Identity.new)` or `Guest.all.each(&GiveCar.new)`?

Proc party! 🎉 🎉 🎉


## Installation

Add this line to your application's Gemfile:

```ruby
gem "proc_party"
```

And then execute:

    $ bundle


## Usage

```ruby
class Identity
  include ProcParty

  def call(n)
    n
  end
end

(1..3).map(&Identity.new) # => [1, 2, 3]


class GiveCar
  include ProcParty

  def call(guest)
    guest.cars.push(Car.new)
    guest.save
    guest
  end
end

Guest.all.each(&GiveCar.new).each(&:celebrate!)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `proc_party.gemspec`, and
then run `bundle exec rake release`, which will create a git tag for the
version, push git commits and tags, and push the `.gem` file to
[rubygems.org][rubygems].


## Contributing

Bug reports and pull requests are welcome on GitHub at
[https://github.com/zachahn/proc_party][home].


## License

The gem is available as open source under the terms of the
[MIT License][mit].


[home]: https://github.com/zachahn/proc_party
[rubygems]: https://rubygems.org
[mit]: http://opensource.org/licenses/MIT
