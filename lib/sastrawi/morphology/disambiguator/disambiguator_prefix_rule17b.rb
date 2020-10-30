module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule17b
        def disambiguate(word)
          contains = /^meng([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "k#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
