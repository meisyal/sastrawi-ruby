module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule29
        def disambiguate(word)
          contains = /^peng([bcdfghjklmnpqrstvwxyz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0] << matches[1]
          end
        end
      end
    end
  end
end
