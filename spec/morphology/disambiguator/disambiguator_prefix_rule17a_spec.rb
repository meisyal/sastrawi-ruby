require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule17a do
        let :disambiguator_prefix_rule17a do
          DisambiguatorPrefixRule17a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule17a.disambiguate('mengerat')).to eq('erat')
        end
      end
    end
  end
end
