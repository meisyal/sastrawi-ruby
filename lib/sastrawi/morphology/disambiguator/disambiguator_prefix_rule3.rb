module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule3
        def disambiguate(word)
          contains = /^ber([bcdfghjklmnpqrstvwxyz])([a-z])er([aiueo])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return if matches[0] == 'r'

            return matches[0] << matches[1] << 'er' << matches[2] << matches[3]
          end
        end
      end
    end
  end
end
