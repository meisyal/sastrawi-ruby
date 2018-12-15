# Sastrawi Bindings for Ruby [![Build Status](https://travis-ci.org/meisyal/sastrawi-ruby.svg?branch=master)](https://travis-ci.org/meisyal/sastrawi-ruby) [![Gem Version](https://badge.fury.io/rb/sastrawi.svg)](https://badge.fury.io/rb/sastrawi)

sastrawi-ruby is Ruby bindings for [Sastrawi][sastrawi], a library which allows you
to stem words in Bahasa Indonesia. The original implementation of Sastrawi was
written in PHP and this library is written in Ruby language.

Taken from [Wikipedia][stemmingwiki], stemming is the process of reducing
inflected (or sometimes derived) words to their word stem, base or root form.
For instance, "menahan" has "tahan" as its base form. If you want to know how
stemming works, please read this [page][howstemmingworks] (in Bahasa Indonesia)
for further details.

## Demo

The demo version of sastrawi-ruby can be accessed [here][demo].

## Documentation

Documentation for this library is available on [here][documentation]. You can
also check [sastrawi-ruby GitHub Wiki][wiki] that contains TODO list.

## Installation

There are two options to install this library. First, if you just want to use
Ruby bindings for Sastrawi, add this line to your application's Gemfile:

    gem 'sastrawi'

and then execute:

    $ bundle install

or you can install directly:

    $ gem install sastrawi

Note that, this library requires Ruby. Ruby 1.9.3 or above should be installed
on your system. I would recommend to use the stable versions.

## Usage

This library supports stemming words with provided base forms.

```ruby
require 'sastrawi'

# create stemmer
stemmer_factory = Sastrawi::Stemmer::StemmerFactory.new
stemmer = stemmer_factory.create_stemmer

# prepare a sentence or words to be stemmed and call the stem API
sentence = 'Perekonomian Indonesia sedang dalam pertumbuhan yang membanggakan.'
stemming_result = stemmer.stem(sentence)

# the stemming result should be "ekonomi indonesia sedang dalam tumbuh yang bangga"
puts stemming_result
```

Beside that, you can add or remove any base form.

```ruby
require 'sastrawi'

# create stemmer
stemmer_factory = Sastrawi::Stemmer::StemmerFactory.new

# create default dictionary and add a text file that contains words into it
dictionary = stemmer_factory.create_default_dictionary
dictionary.add_words_from_text_file('my-dictionary.txt')

# add or remove words
dictionary.add('internet')
dictionary.remove('desa')

# stem a word, "internetan", for example
stemmer = Sastrawi::Stemmer::Stemmer.new(dictionary)

# the stemming result should be "internet"
puts stemmer.stem('internetan')
```

## Contributing

Contributions are welcome. Please, read [CONTRIBUTING][contributing]
guidelines.

## License

This library is released under the terms of MIT License. See the
[LICENSE][license] file for more details. sastrawi-ruby contains base form of
words from [Kateglo][kateglo] and it is licensed under a [Creative Commons
Attribution-NonCommercial-ShareAlike 3.0 Unported License][kateglolicense].


[sastrawi]: https://github.com/sastrawi/sastrawi
[stemmingwiki]: https://en.wikipedia.org/wiki/Stemming
[howstemmingworks]: https://github.com/sastrawi/sastrawi/wiki/Stemming-Bahasa-Indonesia
[demo]: https://sastrawi-ruby-demo.herokuapp.com
[documentation]: https://www.rubydoc.info/gems/sastrawi/
[contributing]: https://github.com/meisyal/sastrawi-ruby/blob/master/CONTRIBUTING.md
[license]: https://github.com/meisyal/sastrawi-ruby/blob/master/LICENSE.txt
[kateglo]: http://kateglo.com
[kateglolicense]: https://creativecommons.org/licenses/by-nc-sa/3.0/
[wiki]: https://github.com/meisyal/sastrawi-ruby/wiki
