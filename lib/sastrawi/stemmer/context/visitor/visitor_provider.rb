module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class VisitorProvider
          attr_accessor :visitors, :suffix_visitors, :prefix_visitors

          def initialize
            @visitors = []
            @suffix_visitors = []
            @prefix_visitors = []

            init_visitors
          end

          def init_visitors
            @visitors = DontStemShortWord.new

            @suffix_visitors = RemoveInflectionalParticle.new
            @suffix_visitors = RemoveInflectionalPossessivePronoun.new
            @suffix_visitors = RemoveDerivationalSuffix.new

            @prefix_visitors = RemovePlainPrefix.new
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule1a.new, DisambiguatorPrefixRule1b.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule2.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule3.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule4.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule5.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule6a.new, DisambiguatorPrefixRule6b.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule7.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule8.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule9.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule10.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule11.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule12.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule13a.new, DisambiguatorPrefixRule13b.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule14.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule15a.new, DisambiguatorPrefixRule15b.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule16.new])

            @prefix_visitors = PrefixDisambiguator.new([
              DisambiguatorPrefixRule17a.new, DisambiguatorPrefixRule17b.new,
              DisambiguatorPrefixRule17c.new, DisambiguatorPrefixRule17d.new
            ])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule18a.new, DisambiguatorPrefixRule18b.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule19.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule20.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule21a.new, DisambiguatorPrefixRule21b.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule23.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule24.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule25.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule26a.new, DisambiguatorPrefixRule26b.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule27.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule28a.new, DisambiguatorPrefixRule28b.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule29.new])

            @prefix_visitors = PrefixDisambiguator.new([
              DisambiguatorPrefixRule30a.new, DisambiguatorPrefixRule30b.new,
              DisambiguatorPrefixRule30c.new
            ])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule31a.new, DisambiguatorPrefixRule31b.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule32.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule34.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule35.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule36.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule37a.new, DisambiguatorPrefixRule37b.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule38a.new, DisambiguatorPrefixRule38b.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule39a.new, DisambiguatorPrefixRule39b.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule40a.new, DisambiguatorPrefixRule40b.new])

            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule41.new])
            @prefix_visitors = PrefixDisambiguator.new([DisambiguatorPrefixRule42.new])
          end
        end
      end
    end
  end
end
