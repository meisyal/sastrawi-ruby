module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class PrefixDisambiguator
          attr_accessor :disambiguators

          def initialize(disambiguators = [])
            add_disambiguators(disambiguators)
          end

          def visit(context)
            result = nil

            @disambiguators.each do |disambiguator|
              result = disambiguator.disambiguate(context.get_current_word)

              next if context.get_dictionary.include?(result)
            end

            return if result.nil?
          end

          def add_disambiguators(disambiguators = [])
            disambiguators.each do |disambiguator|
              self.add_disambiguator(disambiguator)
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
