require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule28b do
        let :disambiguator_prefix_rule28b do
          DisambiguatorPrefixRule28b.new
        end

        let :words do
          %w[penari penerap peninggalan penolong penulis]
        end

        let :expected_words do
          %w[tari terap tinggalan tolong tulis]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule28b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
