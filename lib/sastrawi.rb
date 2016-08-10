require "sastrawi/version"

module Sastrawi
  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
  end
end

class Sastrawi::Translator
  def initialize(language)
    @language = language
  end

  def hi
    case @language
    when "indonesia"
      "Halo dunia!"
    else
      "Hello world!"
    end
  end
end
