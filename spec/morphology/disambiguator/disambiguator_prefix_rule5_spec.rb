require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule5 do
        let :disambiguator_prefix_rule5 do
          DisambiguatorPrefixRule5.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule5.disambiguate('bekerja')).to eq('kerja')
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule5.disambiguate('belajar')).to be_nil
        end
      end
    end
  end
end
