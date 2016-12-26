module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule35
        def disambiguate(word)
          contains = /^ter([bcdfghjkpqstvxz])(er[bcdfghjklmnpqrstvwxyz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return matches[0] << matches[1] << matches[2]
          end
        end
      end
    end
  end
end
