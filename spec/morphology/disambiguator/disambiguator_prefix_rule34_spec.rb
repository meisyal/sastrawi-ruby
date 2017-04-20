require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule34 do
        let :disambiguator_prefix_rule34 do
          DisambiguatorPrefixRule34.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule34.disambiguate('petarung')).to eq('tarung')
        end
      end
    end
  end
end
