require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule26a do
        let :disambiguator_prefix_rule26a do
          DisambiguatorPrefixRule26a.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule26a.disambiguate('pemilik')).to eq('milik')
        end
      end
    end
  end
end
