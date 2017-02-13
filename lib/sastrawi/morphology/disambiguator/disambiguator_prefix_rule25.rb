module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule25
        def disambiguate(word)
          contains = /^pem([bfv])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0] << matches[1]
          end
        end
      end
    end
  end
end
