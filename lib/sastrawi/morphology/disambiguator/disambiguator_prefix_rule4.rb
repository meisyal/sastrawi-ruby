module Sastrawi
  module Morphology
    module Disambiguator
      class DisambiguatorPrefixRule4
        def disambiguate(word)
          return 'ajar' if word == 'belajar'
        end
      end
    end
  end
end
