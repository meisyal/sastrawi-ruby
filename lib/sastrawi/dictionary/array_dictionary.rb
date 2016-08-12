module Sastrawi
  class ArrayDictionary
    attr_accessor :words

    def initialize
      self.words = []
    end

    def lookup(word)
      puts word if words.include?(word)
    end

    def count()
      puts words.length
    end

    def add_words(words)
      # TODO: Add an array to current array.
    end

    def add(word)
      words.push(word)
    end
  end
end
