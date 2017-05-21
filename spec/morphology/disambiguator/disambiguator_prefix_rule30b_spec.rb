require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule30b do
        let :disambiguator_prefix_rule30b do
          DisambiguatorPrefixRule30b.new
        end

        let :words do
          %w[pengawal pengetat pengira pengorban penguat]
        end

        let :expected_words do
          %w[kawal ketat kira korban kuat]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule30b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
