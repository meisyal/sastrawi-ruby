require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule13b do
        let :disambiguator_prefix_rule13b do
          DisambiguatorPrefixRule13b.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule13b.disambiguate('memakai')).to eq('pakai')
        end
      end
    end
  end
end
