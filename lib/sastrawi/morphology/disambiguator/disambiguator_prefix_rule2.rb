module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule2
        def disambiguate(word)
          contains = /^ber([bcdfghjklmnpqrstvwxyz])([a-z])(.*)$/.match(word)

          if contains
            matches = contains.captures

            return if /^er(.*)$/.match(matches[2])

            return "#{matches[0]}#{matches[1]}#{matches[2]}"
          end
        end
      end
    end
  end
end
