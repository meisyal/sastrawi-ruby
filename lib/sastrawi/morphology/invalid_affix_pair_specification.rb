##
# Asian J. (2007) "Effective Techniques for Indonesian Text Retrieval". page 26
# http://researchbank.rmit.edu.au/eserv/rmit:6312/Asian.pdf

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

        matches = false

        invalid_affixes.each do |invalid_affix|
          matches = matches || !!(word =~ invalid_affix)
        end

        matches
      end
    end
  end
end
