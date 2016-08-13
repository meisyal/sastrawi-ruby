module Sastrawi
  module Dictionary
    class ArrayDictionary
      attr_accessor :words

      def initialize
        self.words = []
      end

      def lookup(word)
        puts word if words.include?(word)
      end

      def count
        puts words.length
      end

      def add_words(new_words = [])
        words.concat(new_words)
      end

      def add(word)
        words.push(word)
      end
    end
  end
end
