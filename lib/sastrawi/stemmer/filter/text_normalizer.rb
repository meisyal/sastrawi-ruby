module Sastrawi
  module Stemmer
    module Filter
      class TextNormalizer
        def self.normalize_text(text)
          lowercase_text = text.downcase
          replaced_text = lowercase_text.gsub!(/[^a-z0-9 -]/im, ' ')
          replaced_text = replaced_text.gsub!(/( +)/im, ' ')

          replaced_text.strip!
        end
      end
    end
  end
end
