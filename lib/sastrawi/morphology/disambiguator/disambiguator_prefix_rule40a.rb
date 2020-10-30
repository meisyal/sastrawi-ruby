module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule40a
        def disambiguate(word)
          contains = /^([bcdfghjklmnpqrstvwxyz])(in[aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}#{matches[2]}"
          end
        end
      end
    end
  end
end
