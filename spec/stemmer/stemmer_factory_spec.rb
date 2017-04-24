require 'spec_helper'

module Sastrawi
  module Stemmer
    describe StemmerFactory do
      let :stemmer_factory do
        StemmerFactory.new
      end

      it 'should create a stemmer' do
        expect(stemmer_factory.create_stemmer).to_not be_nil
      end
    end
  end
end
