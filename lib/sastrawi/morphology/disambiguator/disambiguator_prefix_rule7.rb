module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule7
        def disambiguate(word)
          contains = /^ter([bcdfghjklmnpqrstvwxyz])er([aiueo].*)$/.match(word)

          if contains
            matches = contains.captures

            return if matches[0] == 'r'

            return matches[0] << 'er' << matches[1]
          end
        end
      end
    end
  end
end
