module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule27
        def disambiguate(word)
          contains = /^pen([cdjstz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
