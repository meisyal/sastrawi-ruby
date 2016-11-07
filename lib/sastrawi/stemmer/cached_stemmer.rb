module Sastrawi
  module Stemmer
    class CachedStemmer
      attr_reader :cache, :delegated_stemmer

      def initialize(cache, delegated_stemmer)
        @cache = cache
        @delegated_stemmer = delegated_stemmer
      end

      def stem(text)
        # TODO: call TextNormalizer class
        # normalized_text =

        words = normalized_text.split(' ')
        stems = []

        words.each do |word|
          if @cache.has(word)
            stems.push(@cache.get(word))
          else
            stem = @delegated_stemmer.stem(word)
            @cache.set(word, stem)
            stems.push(stem)
          end
        end

        return ' ' << stems
      end

      def get_cache
        @cache
      end

      def get_delegated_stemmer
        @delegated_stemmer
      end
    end
  end
end
