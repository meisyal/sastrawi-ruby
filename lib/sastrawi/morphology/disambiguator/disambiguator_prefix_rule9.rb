module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule9
        def disambiguate(word)
          contains = /^te([bcdfghjklmnpqrstvwxyz])er([bcdfghjklmnpqrstvwxyz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return if matches[0] == 'r'

            return "#{matches[0]}er#{matches[1]}#{matches[2]}"
          end
        end
      end
    end
  end
end
