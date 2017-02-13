module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule17c
        def disambiguate(word)
          contains = /^menge(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0]
          end
        end
      end
    end
  end
end
