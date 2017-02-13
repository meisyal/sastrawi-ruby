module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule30c
        def disambiguate(word)
          contains = /^penge(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0]
          end
        end
      end
    end
  end
end
