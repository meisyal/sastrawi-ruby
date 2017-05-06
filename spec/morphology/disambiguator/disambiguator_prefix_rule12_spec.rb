require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule12 do
        let :disambiguator_prefix_rule12 do
          DisambiguatorPrefixRule12.new
        end

        let :words do
          %w[mempengaruhi memperbaharui]
        end

        let :expected_words do
          %w[pengaruhi perbaharui]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule12.disambiguate(word)).to eq(expected_words[i])
          end
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule12.disambiguate('mewarnai')).to be_nil
        end
      end
    end
  end
end
