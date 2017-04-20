require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule23 do
        let :disambiguator_prefix_rule23 do
          DisambiguatorPrefixRule23.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule23.disambiguate('pertahan')).to eq('tahan')
        end
      end
    end
  end
end
