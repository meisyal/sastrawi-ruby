module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule18a
        def disambiguate(word)
          contains = /^meny([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "ny#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
