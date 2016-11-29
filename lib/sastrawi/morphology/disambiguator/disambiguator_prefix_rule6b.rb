module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule6b
        def disambiguate(word)
          contains = /^ter([aiueo].*)$/.match(word)

          if contains
            matches = contains.captures

            return 'r' << matches[0]
          end
        end
      end
    end
  end
end
