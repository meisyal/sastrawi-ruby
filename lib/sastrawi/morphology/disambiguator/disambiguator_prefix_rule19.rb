module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule19
        def disambiguate(word)
          contains = /^memp([abcdfghijklmopqrstuvwxyz])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return 'p' << matches[0] << matches[1]
          end
        end
      end
    end
  end
end
