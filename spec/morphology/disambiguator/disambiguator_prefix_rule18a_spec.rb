require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule18a do
        let :disambiguator_prefix_rule18a do
          DisambiguatorPrefixRule18a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule18a.disambiguate('menyala')).to eq('nyala')
        end
      end
    end
  end
end
