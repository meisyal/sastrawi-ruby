require 'spec_helper'

require 'sastrawi/dictionary/array_dictionary'

module Sastrawi
  module Stemmer
    describe Stemmer do
      let :word do
        %w[beri internet]
      end

      let :array_dictionary do
        Sastrawi::Dictionary::ArrayDictionary.new(word)
      end

      let :stemmer do
        Stemmer.new(array_dictionary)
      end

      let :short_words do
        %w[mei bui]
      end

      def add_word_to_dictionary(word)
        stemmer.dictionary.add(word)
      end

      it 'should return stemming result immediately for short word' do
        short_words.each_with_index do |word,i|
          expect(stemmer.stem(word)).to eq(short_words[i])
        end
      end

      it 'should return stemming result immediately if word is found in the dictionary' do
        add_word_to_dictionary('nila')

        expect(stemmer.stem('nilai')).to eq('nila')

        add_word_to_dictionary('nilai')

        expect(stemmer.stem('nilai')).to eq('nilai')
      end
    end
  end
end
