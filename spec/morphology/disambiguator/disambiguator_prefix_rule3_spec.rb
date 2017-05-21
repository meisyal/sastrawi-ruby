require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule3 do
        let :disambiguator_prefix_rule3 do
          DisambiguatorPrefixRule3.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule3.disambiguate('berhierarki')).to eq('hierarki')
        end
      end
    end
  end
end
