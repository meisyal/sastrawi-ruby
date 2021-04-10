module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule38a
        def disambiguate(word)
          contains = /^([bcdfghjklmnpqrstvwxyz])(el[aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}#{matches[2]}"
          end
        end
      end
    end
  end
end
