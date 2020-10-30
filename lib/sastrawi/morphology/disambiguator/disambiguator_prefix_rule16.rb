module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule16
        def disambiguate(word)
          contains = /^meng([g|h|q|k])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return "#{matches[0]}#{matches[1]}"
          end
        end
      end
    end
  end
end
