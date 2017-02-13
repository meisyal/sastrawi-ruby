module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule42
        def disambiguate(word)
          contains = /^kau(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0]
          end
        end
      end
    end
  end
end
