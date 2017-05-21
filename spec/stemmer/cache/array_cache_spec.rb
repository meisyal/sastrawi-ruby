require 'spec_helper'

module Sastrawi
  module Stemmer
    module Cache
      describe ArrayCache do
        let :array_cache do
          ArrayCache.new
        end

        def set_cache(key, value)
          array_cache.set(key, value)
        end

        it 'should not have cache' do
          expect(array_cache.has?('abc')).to be false
        end

        it 'should have cache' do
          set_cache('abc', 123)

          expect(array_cache.has?('abc')).to be true
        end

        it 'should be null' do
          expect(array_cache.get('abc')).to be_nil
        end

        it 'should get cache' do
          set_cache('abc', 123)

          expect(array_cache.get('abc')).to eq(123)
        end
      end
    end
  end
end
