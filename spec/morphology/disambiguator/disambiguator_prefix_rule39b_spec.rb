require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule39b do
        let :disambiguator_prefix_rule39b do
          DisambiguatorPrefixRule39b.new
        end

        let :words do
          %w[temali gemetar gemuruh kemerlip kemerlap kemelut]
        end

        let :expected_words do
          %w[tali getar guruh kerlip kerlap kelut]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule39b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
