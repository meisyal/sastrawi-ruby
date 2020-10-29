module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule18b
        def disambiguate(word)
          contains = /^meny([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "s#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
