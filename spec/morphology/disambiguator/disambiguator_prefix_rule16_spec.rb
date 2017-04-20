require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule16 do
        let :disambiguator_prefix_rule16 do
          DisambiguatorPrefixRule16.new
        end

        let :words do
          %w[menggunakan menghambat mengqasar mengkritik]
        end

        let :expected_words do
          %w[gunakan hambat qasar kritik]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule16.disambiguate(word)).to eq(expected_words[i])
          end
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule16.disambiguate('mengira')).to eq(nil)
        end
      end
    end
  end
end
