module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule17a
        def disambiguate(word)
          contains = /^meng([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0] << matches[1]
          end
        end
      end
    end
  end
end
