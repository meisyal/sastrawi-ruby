module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule26a
        def disambiguate(word)
          contains = /^pem([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return 'm' << matches[0] << matches[1]
          end
        end
      end
    end
  end
end
