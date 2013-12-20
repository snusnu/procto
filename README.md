# procto

[![Gem Version](https://badge.fury.io/rb/procto.png)][gem]
[![Build Status](https://secure.travis-ci.org/snusnu/procto.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/snusnu/procto.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/snusnu/procto.png)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/snusnu/procto/badge.png?branch=master)][coveralls]

[gem]: https://rubygems.org/gems/procto
[travis]: https://travis-ci.org/snusnu/procto
[gemnasium]: https://gemnasium.com/snusnu/procto
[codeclimate]: https://codeclimate.com/github/snusnu/procto
[coveralls]: https://coveralls.io/r/snusnu/procto

## Usage

```ruby
require 'procto'

class Greeter
  include Procto.call

  def initialize(text)
    @text = text
  end

  def call
    "Hello #{text}"
  end
end

Greeter.call('world') # => "Hello world"

class Printer
  include Procto.call(:print)

  def initialize(text)
    @text = text
  end

  def print
    "Hello #{text}"
  end
end

Printer.call('world') # => "Hello world"
```

## Credits

* [snusnu](https://github.com/snusnu)
* [mbj](https://github.com/mbj)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Copyright

Copyright &copy; 2013 Martin Gamsjaeger (snusnu). See [LICENSE](LICENSE) for details.
