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
        # TODO: Implement this method here.
      end

      def stem_singular_word(word)
        # TODO: Implement this method here.
      end
    end
  end
end
