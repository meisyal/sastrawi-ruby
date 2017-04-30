require 'spec_helper'

require 'sastrawi/dictionary/array_dictionary'

require 'sastrawi/stemmer/cache/array_cache'

module Sastrawi
  module Stemmer
    describe CachedStemmer do
      let :words do
        %w[makan internet]
      end

      let :array_dictionary do
        Sastrawi::Dictionary::ArrayDictionary.new(words)
      end

      let :delegated_stemmer do
        Stemmer.new(array_dictionary)
      end

      let :array_cache do
        Sastrawi::Stemmer::Cache::ArrayCache.new
      end

      let :cached_stemmer do
        CachedStemmer.new(array_cache, delegated_stemmer)
      end

      def set_cache(key, value)
        cached_stemmer.cache.set(key, value)
      end

      def get_cache(key)
        cached_stemmer.cache.get(key)
      end

      it 'should look up the cache' do
        expect(cached_stemmer.stem('memakan makanan')).to eq('makan makan')

        set_cache('memakan', 'minum')
        expect(cached_stemmer.stem('memakan makanan')).to eq('minum makan')
      end

      it 'should store the result to cache' do
        expect(cached_stemmer.stem('memakan makanan')).to eq('makan makan')
        expect(cached_stemmer.get_cache('memakan')).to eq('makan')
      end
    end
  end
end
