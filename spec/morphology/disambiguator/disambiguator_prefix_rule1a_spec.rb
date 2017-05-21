require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule1a do
        let :disambiguator_prefix_rule1a do
          DisambiguatorPrefixRule1a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule1a.disambiguate('beria-ia')).to eq('ia-ia')
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule1a.disambiguate('berlari')).to be_nil
        end
      end
    end
  end
end
