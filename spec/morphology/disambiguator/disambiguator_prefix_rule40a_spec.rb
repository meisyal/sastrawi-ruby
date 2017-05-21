require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule40a do
        let :disambiguator_prefix_rule40a do
          DisambiguatorPrefixRule40a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule40a.disambiguate('pinang')).to eq('pinang')
        end
      end
    end
  end
end
