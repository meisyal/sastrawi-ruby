class Sastrawi::Translator
  def initialize(language)
    @language = language
  end

  def hi
    case @language
    when "indonesia"
      puts "Halo dunia!"
    else
      puts "Hello world!"
    end
  end
end
