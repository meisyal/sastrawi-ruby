module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule8
        def disambiguate(word)
          contains = /^ter([bcdfghjklmnpqrstvwxyz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return if matches[0] == 'r' || /^er(.*)$/.match(matches[1])

            return matches[0] << matches[1]
          end
        end
      end
    end
  end
end
