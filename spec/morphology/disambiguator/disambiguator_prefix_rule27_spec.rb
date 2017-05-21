require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule27 do
        let :disambiguator_prefix_rule27 do
          DisambiguatorPrefixRule27.new
        end

        let :words do
          %w[pencari pendaki penjual]
        end

        let :expected_words do
          %w[cari daki jual]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule27.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
