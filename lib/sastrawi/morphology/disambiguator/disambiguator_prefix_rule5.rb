module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule5
        def disambiguate(word)
          contains = /^be([bcdfghjklmnpqstvwxyz])(er[bcdfghjklmnpqrstvwxyz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0] << matches[1] << matches[2]
          end
        end
      end
    end
  end
end
