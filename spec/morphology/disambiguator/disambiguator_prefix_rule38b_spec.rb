require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule38b do
        let :disambiguator_prefix_rule38b do
          DisambiguatorPrefixRule38b.new
        end

        let :words do
          %w[telunjuk geletar selidik pelatuk telapak gelombang]
        end

        let :expected_words do
          %w[tunjuk getar sidik patuk tapak gombang]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule38b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
