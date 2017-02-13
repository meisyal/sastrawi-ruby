require 'sastrawi/stemmer/filter/text_normalizer'

module Sastrawi
  module Stemmer
    class CachedStemmer
      attr_accessor :cache, :delegated_stemmer

      def initialize(cache, delegated_stemmer)
        @cache = cache
        @delegated_stemmer = delegated_stemmer
      end

      def stem(text)
        normalized_text = Sastrawi::Stemmer::Filter::TextNormalizer.normalize_text(text)

        words = normalized_text.split(' ')
        stems = []

        words.each do |word|
          if @cache.has?(word)
            stems.push(@cache.get(word))
          else
            stem = @delegated_stemmer.stem(word)
            @cache.set(word, stem)
            stems.push(stem)
          end
        end

        stems.join(' ')
      end
    end
  end
end
