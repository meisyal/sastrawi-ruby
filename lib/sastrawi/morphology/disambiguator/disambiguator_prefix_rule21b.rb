module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule21b
        def disambiguate(word)
          contains = /^pe(r[aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
