require 'cache/array_cache'
require 'dictionary/array_dictionary'

module Sastrawi
  module Stemmer
    class StemmerFactory
      def create_stemmer(is_dev = false)
        stemmer = Stemmer.new(self.create_default_dictionary(is_dev))

        cache_result = ArrayCache.new
        cached_stemmer = CachedStemmer.new(cache_result, stemmer)

        return cached_stemmer
      end

      def create_default_dictionary(is_dev = false)
        words = self.get_words(is_dev)
        dictionary = ArrayDictionary.new(words)

        return dictionary
      end

      def get_words(is_dev = false)
        self.get_words_from_file
      end

      def get_words_from_file
        current_directory = File.expand_path('../../..')
        dictionary_file_path = File.join(current_directory, 'data/kata-dasar.txt')

        dictionary_content = File.open(dictionary_file_path, 'rb') { |f| f.read }

        return dictionary_content.split('\n')
      end
    end
  end
end
