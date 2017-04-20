require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule37a do
        let :disambiguator_prefix_rule37a do
          DisambiguatorPrefixRule37a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule37a.disambiguate('perang')).to eq('perang')
        end
      end
    end
  end
end
