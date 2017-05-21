require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule4 do
        let :disambiguator_prefix_rule4 do
          DisambiguatorPrefixRule4.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule4.disambiguate('belajar')).to eq('ajar')
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule4.disambiguate('bekerja')).to be_nil
        end
      end
    end
  end
end
