require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule14 do
        let :disambiguator_prefix_rule14 do
          DisambiguatorPrefixRule14.new
        end

        let :words do
          %w[mencantum menduduki menjemput mensyukuri mensyaratkan mentaati menziarahi]
        end

        let :expected_words do
          %w[cantum duduki jemput syukuri syaratkan taati ziarahi]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule14.disambiguate(word)).to eq(expected_words[i])
          end
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule14.disambiguate('menyayangi')).to be_nil
        end
      end
    end
  end
end
