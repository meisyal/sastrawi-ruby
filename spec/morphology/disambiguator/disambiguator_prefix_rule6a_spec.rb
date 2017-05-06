require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule6a do
        let :disambiguator_prefix_rule6a do
          DisambiguatorPrefixRule6a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule6a.disambiguate('terancam')).to eq('ancam')
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule6a.disambiguate('terbalik')).to be_nil
        end
      end
    end
  end
end
