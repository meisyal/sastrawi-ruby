module Sastrawi
  module Dictionary
    class ArrayDictionary
      attr_reader :words

      def initialize(words = [])
        @words = []

        add_words(words)
      end

      ##
      # Check whether a word is contained in the dictionary

      def contains?(word)
        @words.include?(word)
      end

      ##
      # Count how many words in the dictionary

      def count
        @words.length
      end

      ##
      # Add multiple words to the dictionary

      def add_words(new_words)
        new_words.each do |word|
          add(word)
        end
      end

      ##
      # Add a word to the dictionary

      def add(word)
        return if word.strip == ''

        @words.push(word)
      end

      ##
      # Add words from a text file to the dictionary

      def add_words_from_text_file(file_path)
        words = []

        File.open(file_path, 'r') do |file|
          file.each do |line|
            words.push(line.chomp)
          end
        end

        add_words(words)
      end

      ##
      # Remove a word from the dictionary

      def remove(word)
        @words.delete(word)
      end
    end
  end
end
