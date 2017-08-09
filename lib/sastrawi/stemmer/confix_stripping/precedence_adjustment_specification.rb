##
# Confix Stripping Rule Precendence Adjustment Specification
# Asian J. (2007) "Effective Techniques for Indonesian Text Retrieval" page 78-79
# http://researchbank.rmit.edu.au/eserv/rmit:6312/Asian.pdf

module Sastrawi
  module Stemmer
    module ConfixStripping
      class PrecedenceAdjustmentSpecification
        def satisfied_by?(value)
          regex_rules = [
            /^be(.*)lah$/, /^be(.*)an$/, /^me(.*)i$/,
            /^di(.*)i$/, /^pe(.*)i$/, /^ter(.*)i$/
          ]

          regex_rules.each do |rule|
            return true if rule.match(value)
          end

          false
        end
      end
    end
  end
end
