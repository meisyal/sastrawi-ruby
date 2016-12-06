module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule13b
        def disambiguate(word)
          contains = /^mem([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return 'p' << matches[0] << matches[1]
          end
        end
      end
    end
  end
end
