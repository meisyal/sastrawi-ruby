module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemoveInflectionalParticle
          def visit(context)
            result = remove(context.get_current_word)

            if result != context.get_current_word
              removed_part = context.get_current_word.sub(result, '')

              removal = Removal.new(context.get_current_word, result, removed_part, 'PP')

              context.add_removal(removal)
              context.set_current_word(result)
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
