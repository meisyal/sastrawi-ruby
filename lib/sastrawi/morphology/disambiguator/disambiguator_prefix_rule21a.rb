module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule21a
        def disambiguate(word)
          contains = /^per([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
