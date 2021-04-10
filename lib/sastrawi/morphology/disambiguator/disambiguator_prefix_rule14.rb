module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule14
        def disambiguate(word)
          contains = /^men([cdjstz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
