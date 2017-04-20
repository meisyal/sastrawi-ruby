require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule2 do
        let :disambiguator_prefix_rule2 do
          DisambiguatorPrefixRule2.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule2.disambiguate('bertabur')).to eq('tabur')
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule2.disambiguate('beria-ia')).to eq(nil)
        end
      end
    end
  end
end
