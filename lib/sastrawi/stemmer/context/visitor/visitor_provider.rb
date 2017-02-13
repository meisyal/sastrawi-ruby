require 'sastrawi/stemmer/context/visitor/dont_stem_short_word'
require 'sastrawi/stemmer/context/visitor/remove_inflectional_particle'
require 'sastrawi/stemmer/context/visitor/remove_inflectional_possessive_pronoun'
require 'sastrawi/stemmer/context/visitor/remove_derivational_suffix'
require 'sastrawi/stemmer/context/visitor/remove_plain_prefix'
require 'sastrawi/stemmer/context/visitor/prefix_disambiguator'

require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule1a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule1b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule2'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule3'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule4'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule5'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule6a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule6b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule7'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule8'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule9'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule10'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule11'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule12'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule13a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule13b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule14'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule15a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule15b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule16'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule17a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule17b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule17c'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule17d'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule18a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule18b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule19'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule20'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule21a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule21b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule23'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule24'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule25'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule26a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule26b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule27'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule28a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule28b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule29'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule30a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule30b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule30c'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule31a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule31b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule32'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule34'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule35'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule36'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule37a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule37b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule38a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule38b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule39a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule39b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule40a'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule40b'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule41'
require 'sastrawi/morphology/disambiguator/disambiguator_prefix_rule42'

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
            @visitors.push(Sastrawi::Stemmer::Context::Visitor::DontStemShortWord.new)

            @suffix_visitors.push(Sastrawi::Stemmer::Context::Visitor::RemoveInflectionalParticle.new)
            @suffix_visitors.push(Sastrawi::Stemmer::Context::Visitor::RemoveInflectionalPossessivePronoun.new)
            @suffix_visitors.push(Sastrawi::Stemmer::Context::Visitor::RemoveDerivationalSuffix.new)

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::RemovePlainPrefix.new)
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule1a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule1b.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule2.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule3.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule4.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule5.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule6a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule6b.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule7.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule8.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule9.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule10.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule11.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule12.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule13a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule13b.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule14.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule15a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule15b.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule16.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([
              Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule17a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule17b.new,
              Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule17c.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule17d.new
            ]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule18a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule18b.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule19.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule20.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule21a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule21b.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule23.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule24.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule25.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule26a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule26b.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule27.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule28a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule28b.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule29.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([
              Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule30a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule30b.new,
              Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule30c.new
            ]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule31a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule31b.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule32.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule34.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule35.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule36.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule37a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule37b.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule38a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule38b.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule39a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule39b.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule40a.new, Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule40b.new]))

            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule41.new]))
            @prefix_visitors.push(Sastrawi::Stemmer::Context::Visitor::PrefixDisambiguator.new([Sastrawi::Morphology::Disambiguator::DisambiguatorPrefixRule42.new]))
          end
        end
      end
    end
  end
end
