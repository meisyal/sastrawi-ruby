module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule31b
        def disambiguate(word)
          contains = /^peny([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "s#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
