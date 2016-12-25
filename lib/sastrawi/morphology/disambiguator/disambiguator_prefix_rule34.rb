module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule34
        def disambiguate(word)
          contains = /^pe([bcdfghjklmnpqrstvwxyz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return if /^er(.*)$/.match(matches[1])

            return matches[0] << matches[1]
          end
        end
      end
    end
  end
end
