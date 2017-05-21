require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule17d do
        let :disambiguator_prefix_rule17d do
          DisambiguatorPrefixRule17d.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule17d.disambiguate('mengerikan')).to eq('ngerikan')
        end
      end
    end
  end
end
