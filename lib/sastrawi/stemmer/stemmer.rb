require 'filter/text_normalizer'

module Sastrawi
  module Stemmer
    class Stemmer
      attr_reader :dictionary, :visitor_provider

      def initialize(dictionary)
        @dictionary = dictionary
        @visitor_provider = VisitorProvider.new
      end

      def get_dictionary
        @dictionary
      end

      def stem(text)
        normalized_text = TextNormalizer.normalize_text(text)

        words = normalize_text.split(' ')
        stems = []

        words.each { |w| stems.push(w) }

        stems.join(' ')
      end

      def stem_word(word)
        if self.plural?(word)
          self.stem_plural_word(word)
        else
          self.stem_singular_word(word)
        end
      end

      def plural?(word)
        match = /^(.*)-(ku|mu|nya|lah|kah|tah|pun)$/.match(word)

        if match
          match.captures[1].index('-') != -1
        end

        word.index('-') != -1
      end

      def stem_plural_word(word)
        match_one = /^(.*)-(.*)$/.match(word)

        unless match_one
          word
        end

        words = [match_one.captures[1], match_one.captures[2]]

        suffix = words[1]
        suffixes = ['ku', 'mu', 'nya', 'lah', 'kah', 'tah', 'pun']
        match_two = /^(.*)-(.*)$/.match(words[0])

        if suffixes.include?(suffix) && match_two.include?(suffix)
          words[0] = match_two.captures[1]
          words[1] = match_two.captures[2] + '-' + suffix
        end

        root_first_word = self.stem_singular_word(words[0])
        root_second_word = self.stem_singular_word(words[1])

        unless self.dictionary.contains(words[1]) && root_second_word == words[1]
          root_second_word = self.stem_singular_word('me' + words[1])
        end

        if root_first_word == root_second_word
          root_first_word
        else
          word
        end
      end

      def stem_singular_word(word)
        # TODO: Implement this method here.
      end
    end
  end
end
