module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class PrefixDisambiguator
          attr_accessor :disambiguators

          def initialize(disambiguators = [])
            @disambiguators = []

            add_disambiguators(disambiguators)
          end

          def visit(context)
            result = nil

            @disambiguators.each do |disambiguator|
              result = disambiguator.disambiguate(context.current_word)

              break if context.dictionary.contains?(result)
            end

            return if result.nil?

            removed_part = context.current_word.sub(result, '')

            removal = Removal.new(self, context.current_word, result, removed_part, 'DP')

            context.add_removal(removal)
            context.current_word = result
          end

          def add_disambiguators(disambiguators)
            disambiguators.each do |disambiguator|
              add_disambiguator(disambiguator)
            end
          end

          def add_disambiguator(disambiguator)
            @disambiguators.push(disambiguator)
          end
        end
      end
    end
  end
end
