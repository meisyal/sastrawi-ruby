require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule7 do
        let :disambiguator_prefix_rule7 do
          DisambiguatorPrefixRule7.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule7.disambiguate('terperuk')).to eq('peruk')
        end
      end
    end
  end
end
