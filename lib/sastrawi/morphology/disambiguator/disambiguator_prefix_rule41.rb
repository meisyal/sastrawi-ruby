module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule41
        def disambiguate(word)
          contains = /^ku(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0]
          end
        end
      end
    end
  end
end
