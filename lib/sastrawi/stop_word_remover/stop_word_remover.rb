module Sastrawi
  module StopWordRemover
    class StopWordRemover
      attr_reader :dictionary

      def initialize(dictionary)
        @dictionary = dictionary
      end

      ##
      # Remove stop words

      def remove(text)
        words = text.split(' ')
        stop_words = []

        words.each do |word|
          unless @dictionary.contains?(word)
            stop_words.push(word)
          end
        end

        stop_words.join(' ')
      end
    end
  end
end
