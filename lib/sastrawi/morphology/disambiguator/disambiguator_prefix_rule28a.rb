module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule28a
        def disambiguate(word)
          contains = /^pen([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return 'n' << matches[0] << matches[1]
          end
        end
      end
    end
  end
end
