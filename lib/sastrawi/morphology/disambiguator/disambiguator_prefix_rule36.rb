module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule36
        def disambiguate(word)
          contains = /^pe([bcdfghjkpqstvxz])(er[bcdfghjklmnpqrstvwxyz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}#{matches[2]}"
          end
        end
      end
    end
  end
end
