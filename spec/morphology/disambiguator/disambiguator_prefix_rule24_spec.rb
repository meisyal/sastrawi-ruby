require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule24 do
        let :disambiguator_prefix_rule24 do
          DisambiguatorPrefixRule24.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule24.disambiguate('perdaerah')).to eq('daerah')
        end
      end
    end
  end
end
