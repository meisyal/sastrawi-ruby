module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule1a
        def disambiguate(word)
          contains = /^ber([aiueo].*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0]
          end
        end
      end
    end
  end
end
