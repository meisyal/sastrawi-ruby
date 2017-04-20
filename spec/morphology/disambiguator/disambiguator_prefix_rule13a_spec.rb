require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule13a do
        let :disambiguator_prefix_rule13a do
          DisambiguatorPrefixRule13a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule13a.disambiguate('memasuki')).to eq('masuki')
        end
      end
    end
  end
end
