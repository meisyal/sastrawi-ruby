module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule1a
        def disambiguate(word)
          if contains = /^ber([aiueo].*)$/.match(word)
            matches = contains.captures

            return matches[0]
          end
        end
      end
    end
  end
end
