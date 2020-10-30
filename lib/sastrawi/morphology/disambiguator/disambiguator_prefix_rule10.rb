module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule10
        def disambiguate(word)
          contains = /^me([lrwy])([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}#{matches[2]}"
          end
        end
      end
    end
  end
end
