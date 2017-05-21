require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule29 do
        let :disambiguator_prefix_rule29 do
          DisambiguatorPrefixRule29.new
        end

        let :words do
          %w[pengganti penghajar pengqasar]
        end

        let :expected_words do
          %w[ganti hajar qasar]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule29.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
