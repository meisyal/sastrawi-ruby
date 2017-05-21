require 'spec_helper'

module Sastrawi
  module Dictionary
    describe ArrayDictionary do
      let :array_dictionary do
        ArrayDictionary.new
      end

      let :words do
        %w[first_word second_word]
      end

      def add_word(word)
        array_dictionary.add(word)
      end

      def add_words(words)
        array_dictionary.add_words(words)
      end

      it 'should not contain "word"' do
        expect(array_dictionary.contains?('word')).to be false
      end

      it 'should contain "word"' do
        add_word('word')

        expect(array_dictionary.contains?('word')).to be true
      end

      it 'should count empty dictionary' do
        expect(array_dictionary.count).to eq(0)
      end

      it 'should count words in the dictionary' do
        add_word('word')

        expect(array_dictionary.count).to eq(1)
      end

      it 'should ignore empty string' do
        add_word('')

        expect(array_dictionary.count).to eq(0)
      end

      it 'should add multiple words' do
        add_words(words)

        expect(array_dictionary.count).to eq(2)
      end
    end
  end
end
