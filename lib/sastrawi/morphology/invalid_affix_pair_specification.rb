module Sastrawi
  module Morphology
    class InvalidAffixPairSpecification
      def satisfied_by?(word)
        return false if /^me(.*)kan$/.match(word)

        return false if word == 'ketahui'

        invalid_affixes = [
          /^ber(.*)i$/, /^di(.*)an$/, /^ke(.*)i$/, /^ke(.*)an$/,
          /^me(.*)an$/, /^me(.*)an$/, /^ter(.*)an$/, /^per(.*)an$/
        ]

        contains = false

        invalid_affixes.each do |invalid_affix|
          contains = contains || invalid_affix.match(word)
        end

        return contains
      end
    end
  end
end
