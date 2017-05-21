require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule19 do
        let :disambiguator_prefix_rule19 do
          DisambiguatorPrefixRule19.new
        end

        let :words do
          %w[memproteksi mempatroli]
        end

        let :expected_words do
          %w[proteksi patroli]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule19.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
