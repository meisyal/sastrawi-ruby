module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemoveDerivationalSuffix
          def visit(context)
            result = remove_suffix(context.get_current_word)

            if result != context.get_current_word
              removed_part = context.get_current_word.sub(result, '')

              removal = Removal.new(context.get_current_word, result, removed_part, 'DS')

              context.add_removal(removal)
              context.set_current_word(result)
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
