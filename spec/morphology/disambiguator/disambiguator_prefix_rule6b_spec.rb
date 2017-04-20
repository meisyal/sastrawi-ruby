require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule6b do
        let :disambiguator_prefix_rule6b do
          DisambiguatorPrefixRule6b.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule6b.disambiguate('teracun')).to eq('racun')
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule6b.disambiguate('terbaik')).to eq(nil)
        end
      end
    end
  end
end
