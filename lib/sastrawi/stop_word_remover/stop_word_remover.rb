module Sastrawi
  module StopWordRemover
    class StopWordRemover
      attr_accessor :dictionary

      def initialize(dictionary)
        @dictionary = dictionary
      end

      def remove(text)
        words = text.split(' ')
        stop_words = []

        words.each do |word|
          unless @dictionary.include?(word)
            stop_words.push(word)
          end
        end

        stop_words.join(' ')
      end
    end
  end
end
