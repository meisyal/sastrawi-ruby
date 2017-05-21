require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule39a do
        let :disambiguator_prefix_rule39a do
          DisambiguatorPrefixRule39a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule39a.disambiguate('pemain')).to eq('pemain')
        end
      end
    end
  end
end
