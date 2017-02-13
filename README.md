# Sastrawi Bindings for Ruby [![Build Status](https://travis-ci.org/meisyal/sastrawi-ruby.svg?branch=master)](https://travis-ci.org/meisyal/sastrawi-ruby)

sastrawi-ruby is Ruby bindings for [Sastrawi][sastrawi], a library which allows you
to stem words in Bahasa Indonesia. The original implementation of Sastrawi was
written in PHP and this library is written in Ruby language.

Taken from [Wikipedia][stemmingwiki], stemming is the process of reducing
inflected (or sometimes derived) words to their word stem, base or root form.
For instance, "menahan" has "tahan" as its base form.

## Documentation

Documentation for this library is not available at this moment. But, you can
check [sastrawi-ruby GitHub Wiki][documentation] that contains TODO list.

## Installation

There are two options to install this library. First, if you just want to use
Ruby bindings for Sastrawi, add this line to your application's Gemfile:

  gem 'sastrawi'

and then execute:

  bundle install

or you can install directly:

  gem install sastrawi

Note that, this library requires Ruby. Ruby 1.9.3 or above should be installed
on your system. I would recommend to choose the stable versions.

## Usage

Currently, this library supports stemming words with provided base forms. You
can't add or remove any base form. This feature will be implemented for next
release.

```ruby
require 'sastrawi'

# prepare a sentence or words to be stemmed and call the stem API
sentence = 'Perekonomian Indonesia sedang dalam pertumbuhan yang membanggakan.'
stemming_result = Sastrawi.stem(sentence)

# the stemming result should be "ekonomi indonesia sedang dalam tumbuh yang
bangga"
puts stemming_result
```

## Contributing

Contributions are welcome. If you find a bug, please report it to issue
tracker. Use `dev` branch as a target of your feature branch for pull request.
Both issue and pull request details should be written in English.

## License

This library is released under the terms of MIT License. See the
[LICENSE][license] file for more details. sastrawi-ruby contains base form of
words from [Kateglo][kateglo] and it is licensed under a [Creative Commons
Attribution-NonCommercial-ShareAlike 3.0 Unported License][kateglolicense].

[sastrawi]: https://github.com/sastrawi/sastrawi
[stemmingwiki]: https://en.wikipedia.org/wiki/Stemming
[documentation]: https://github.com/meisyal/sastrawi-ruby/wiki
[license]: https://github.com/meisyal/sastrawi-ruby/blob/master/LICENSE.txt
[kateglo]: http://kateglo.com
[kateglolicense]: https://creativecommons.org/licenses/by-nc-sa/3.0/
