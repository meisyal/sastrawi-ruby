module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule26b
        def disambiguate(word)
          contains = /^pem([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return 'p' << matches[0] << matches[1]
          end
        end
      end
    end
  end
end
