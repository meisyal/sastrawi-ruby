module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule12
        def disambiguate(word)
          contains = /^mempe(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "pe#{matches[0]}"
          end
        end
      end
    end
  end
end
