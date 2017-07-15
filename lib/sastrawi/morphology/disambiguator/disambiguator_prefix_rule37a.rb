module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule37a
        def disambiguate(word)
          contains = /^([bcdfghjklmnpqrstvwxyz])(er[aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0] << matches[1] << matches[2]
          end
        end
      end
    end
  end
end
