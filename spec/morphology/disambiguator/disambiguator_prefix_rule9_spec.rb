require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule9 do
        let :disambiguator_prefix_rule9 do
          DisambiguatorPrefixRule9.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule9.disambiguate('teterbang')).to eq('terbang')
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule9.disambiguate('terperuk')).to be_nil
        end
      end
    end
  end
end
