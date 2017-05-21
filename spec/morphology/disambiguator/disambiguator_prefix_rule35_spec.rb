require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule35 do
        let :disambiguator_prefix_rule35 do
          DisambiguatorPrefixRule35.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule35.disambiguate('terpercaya')).to eq('percaya')
        end
      end
    end
  end
end
