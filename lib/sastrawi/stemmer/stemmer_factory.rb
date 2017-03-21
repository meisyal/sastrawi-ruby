require 'sastrawi/dictionary/array_dictionary'

require 'sastrawi/stemmer/cached_stemmer'
require 'sastrawi/stemmer/stemmer'
require 'sastrawi/stemmer/cache/array_cache'

module Sastrawi
  module Stemmer
    class StemmerFactory
      def create_stemmer(is_dev = false)
        stemmer = Sastrawi::Stemmer::Stemmer.new(create_default_dictionary(is_dev))

        cache_result = Sastrawi::Stemmer::Cache::ArrayCache.new
        cached_stemmer = Sastrawi::Stemmer::CachedStemmer.new(cache_result, stemmer)

        cached_stemmer
      end

      def create_default_dictionary(is_dev = false)
        words = get_words(is_dev)
        dictionary = Sastrawi::Dictionary::ArrayDictionary.new(words)

        dictionary
      end

      def get_words(is_dev = false)
        get_words_from_file
      end

      def get_words_from_file
        root_directory = File.expand_path('../../../..', __FILE__)
        dictionary_file_path = File.join(root_directory, 'data/kata-dasar.txt')

        dictionary_content = []
        File.open(dictionary_file_path, 'r') do |file|
          file.each do |line|
            dictionary_content.push(line.chomp)
          end
        end

        dictionary_content
      end
    end
  end
end
