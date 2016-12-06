module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule13a
        def disambiguate(word)
          contains = /^mem([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return 'm' << matches[0] << matches[1]
          end
        end
      end
    end
  end
end
