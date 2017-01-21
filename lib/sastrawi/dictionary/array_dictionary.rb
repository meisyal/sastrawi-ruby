module Sastrawi
  module Dictionary
    class ArrayDictionary
      attr_accessor :words

      def initialize(words = [])
        @words = []

        add_words(words)
      end

      def contains(word)
        return word if @words.include?(word)
      end

      def count
        @words.length
      end

      def add_words(new_words)
        @words.concat(new_words)
      end

      def add(word)
        return if word == ''

        @words.push(word)
      end
    end
  end
end
