module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule32
        def disambiguate(word)
          return 'ajar' if word == 'pelajar'

          contains = /^pe(l[aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0] << matches[1]
          end
        end
      end
    end
  end
end
