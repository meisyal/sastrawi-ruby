require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule41 do
        let :disambiguator_prefix_rule41 do
          DisambiguatorPrefixRule41.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule41.disambiguate('kumiliki')).to eq('miliki')
        end
      end
    end
  end
end
