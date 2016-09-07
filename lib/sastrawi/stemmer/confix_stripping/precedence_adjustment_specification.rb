module Sastrawi
  module Stemmer
    module ConfixStripping
      class PrecedenceAdjustmentSpecification
        def satisfied_by?(value)
          regex_rules = ['/^be(.*)lah$/', '/^be(.*)an$/', '/^me(.*)i$/', '/^di(.*)i$/', '/^pe(.*)i$/', '/^ter(.*)i$/']

          regex_rules.each do |r|
            return true if r.gsub!(regex_rules, value)
          end

          false
        end
      end
    end
  end
end
