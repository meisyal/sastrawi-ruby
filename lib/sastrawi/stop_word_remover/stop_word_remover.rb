module Sastrawi
  module StopWordRemover
    class StopWordRemover
      attr_reader :dictionary

      def initialize(dictionary)
        @dictionary = dictionary
      end

      def get_dictionary
        @dictionary
      end

      def remove(text)
        words = text.split(' ')
        stop_words = []

        words.each do |word|
          if !@dictionary.include?(word)
            stop_words.push(word)
          end
        end

        return ' ' << stop_words
      end
    end
  end
end
