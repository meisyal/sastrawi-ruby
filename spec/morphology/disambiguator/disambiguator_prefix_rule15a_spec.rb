require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule15a do
        let :disambiguator_prefix_rule15a do
          DisambiguatorPrefixRule15a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule15a.disambiguate('menikmati')).to eq('nikmati')
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule15a.disambiguate('menyayangi')).to be_nil
        end
      end
    end
  end
end
