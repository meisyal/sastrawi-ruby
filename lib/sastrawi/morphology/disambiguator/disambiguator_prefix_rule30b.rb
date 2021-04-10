module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule30b
        def disambiguate(word)
          contains = /^peng([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "k#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
