require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule38a do
        let :disambiguator_prefix_rule38a do
          DisambiguatorPrefixRule38a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule38a.disambiguate('pelawat')).to eq('pelawat')
        end
      end
    end
  end
end
