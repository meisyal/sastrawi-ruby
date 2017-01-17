module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemoveInflectionalPossessivePronoun
          def visit(context)
            result = remove(context.current_word)

            if result != context.current_word
              removed_part = context.current_word.sub(result, '')

              removal = Removal.new(context.current_word, result, removed_part, 'PP')

              context.add_removal(removal)
              context.current_word = result
            end
          end

          def remove(word)
            word.sub(/-*(ku|mu|nya)$/, '')
          end
        end
      end
    end
  end
end
