require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule1b do
        let :disambiguator_prefix_rule1b do
          DisambiguatorPrefixRule1b.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule1b.disambiguate('berakit')).to eq('rakit')
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule1b.disambiguate('bertabur')).to be_nil
        end
      end
    end
  end
end
