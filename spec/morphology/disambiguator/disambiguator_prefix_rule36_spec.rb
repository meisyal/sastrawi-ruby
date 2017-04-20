require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule36 do
        let :disambiguator_prefix_rule36 do
          DisambiguatorPrefixRule36.new
        end

        let :words do
          %w[pekerja peserta]
        end

        let :expected_words do
          %w[kerja serta]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule36.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
