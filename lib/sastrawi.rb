require "sastrawi/version"
require "sastrawi/translator"

module Sastrawi
  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
  end
end
