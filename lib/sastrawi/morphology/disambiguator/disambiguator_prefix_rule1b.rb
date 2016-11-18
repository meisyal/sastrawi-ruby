module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule1b
        def disambiguate(word)
          if contains = /^ber([aiueo].*)$/.match(word)
            matches = contains.captures

            return 'r' << matches[0]
          end
        end
      end
    end
  end
end
