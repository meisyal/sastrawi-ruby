module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemoveInflectionalParticle
          def visit(context)
            result = remove(context.current_word)

            if result != context.current_word
              removed_part = context.current_word.sub(result, '')

              removal = Removal.new(self, context.current_word, result, removed_part, 'P')

              context.add_removal(removal)
              context.current_word = result
            end
          end

          def remove(word)
            word.sub(/-*(lah|kah|tah|pun)$/, '')
          end
        end
      end
    end
  end
end
