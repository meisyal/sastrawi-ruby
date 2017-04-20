require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule42 do
        let :disambiguator_prefix_rule42 do
          DisambiguatorPrefixRule42.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule42.disambiguate('kaumiliki')).to eq('miliki')
        end
      end
    end
  end
end
