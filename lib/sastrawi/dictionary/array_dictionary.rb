module Sastrawi
  module Dictionary
    class ArrayDictionary
      attr_reader :words

      def initialize(words = [])
        @words = []

        add_words(words)
      end

      def contains?(word)
        @words.include?(word)
      end

      def count
        @words.length
      end

      def add_words(new_words)
        new_words.each do |word|
          add(word)
        end
      end

      def add(word)
        return if word == ''

        @words.push(word)
      end
    end
  end
end
