module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule15a
        def disambiguate(word)
          contains = /^men([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return 'n' << matches[0] << matches[1]
          end
        end
      end
    end
  end
end
