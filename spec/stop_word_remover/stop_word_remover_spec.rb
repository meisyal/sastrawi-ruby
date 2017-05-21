require 'spec_helper'

require 'sastrawi/dictionary/array_dictionary'

require 'sastrawi/stop_word_remover/stop_word_remover'

module Sastrawi
  module StopWordRemover
    describe StopWordRemover do
      let :words do
        %w[di ke]
      end

      let :array_dictionary do
        Sastrawi::Dictionary::ArrayDictionary.new(words)
      end

      let :stop_word_remover do
        Sastrawi::StopWordRemover::StopWordRemover.new(array_dictionary)
      end

      it 'should get dictionary' do
        expect(stop_word_remover.dictionary).to be(array_dictionary)
      end

      it 'should remove stop words' do
        expect(stop_word_remover.remove('pergi ke sekolah')).to eq('pergi sekolah')
        expect(stop_word_remover.remove('makan di rumah')).to eq('makan rumah')
      end
    end
  end
end
