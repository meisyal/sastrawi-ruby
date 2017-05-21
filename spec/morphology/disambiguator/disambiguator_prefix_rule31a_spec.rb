require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule31a do
        let :disambiguator_prefix_rule31a do
          DisambiguatorPrefixRule31a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule31a.disambiguate('penyanyi')).to eq('nyanyi')
        end
      end
    end
  end
end
