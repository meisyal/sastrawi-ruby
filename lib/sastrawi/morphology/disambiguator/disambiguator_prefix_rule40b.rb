module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule40b
        def disambiguate(word)
          contains = /^([bcdfghjklmnpqstvwxyz])in([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0] << matches[1] << matches[2]
          end
        end
      end
    end
  end
end
