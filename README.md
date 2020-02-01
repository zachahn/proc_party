# ProcParty

Ever had a class with just one method? Maybe it was named `#call` or `#process`?

Ever wondered who you were (`(1..3).map(&Identity.new)`) or wanted to give
everyone in your audience a car (`Guest.all.each(&GiveCar.new)`)?

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
```


```ruby
class GiveCar
  include ProcParty

  def initialize(make, model)
    @make = make
    @model = model
  end

  def call(guest)
    car = Car.create(make: @make, model: @model)
    guest.cars.push(car)
    guest.save
  end
end

Guest.all.select(&GiveCar.new("Pontiac", "G6")).each(&:celebrate!)
```

So many procs! So easy to make! Proc Party!


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.


## Contributing

Bug reports and pull requests are welcome on GitHub at
[https://github.com/zachahn/proc_party][home].


## License

The gem is available as open source under the terms of the
[MIT License][mit].


[home]: https://github.com/zachahn/proc_party
[rubygems]: https://rubygems.org
[mit]: https://opensource.org/licenses/MIT
