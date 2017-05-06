require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule8 do
        let :disambiguator_prefix_rule8 do
          DisambiguatorPrefixRule8.new
        end

        it 'should disambiguate' do
          expect(disambiguator_prefix_rule8.disambiguate('tertangkap')).to eq('tangkap')
        end

        it 'should be null' do
          ['teracun', 'terperuk'].each do |word|
            expect(disambiguator_prefix_rule8.disambiguate(word)).to be_nil
          end
        end
      end
    end
  end
end
