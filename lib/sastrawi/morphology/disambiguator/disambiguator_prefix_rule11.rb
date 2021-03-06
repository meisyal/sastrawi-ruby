module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule11
        def disambiguate(word)
          contains = /^mem([bfv])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
