module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule15b
        def disambiguate(word)
          contains = /^men([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return 't' << matches[0] << matches[1]
          end
        end
      end
    end
  end
end
