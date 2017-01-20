require 'sastrawi/version'

require 'sastrawi/stemmer/stemmer_factory'

module Sastrawi
  def self.stem(sentence)
      stemmer_factory = Sastrawi::Stemmer::StemmerFactory.new
      stemmer = stemmer_factory.create_stemmer

      puts stemmer.stem(sentence)
  end
end
