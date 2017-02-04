module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemoveDerivationalSuffix
          def visit(context)
            result = remove_suffix(context.current_word)

            if result != context.current_word
              removed_part = context.current_word.sub(result, '')

              removal = Removal.new(self, context.current_word, result, removed_part, 'DS')

              context.add_removal(removal)
              context.current_word = result
            end
          end

          def remove_suffix(word)
            word.sub(/(is|isme|isasi|i|kan|an)$/, '')
          end
        end
      end
    end
  end
end
