require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule28a do
        let :disambiguator_prefix_rule28a do
          DisambiguatorPrefixRule28a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule28a.disambiguate('penilai')).to eq('nilai')
        end
      end
    end
  end
end
