module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemovePlainPrefix
          def visit(context)
            result = remove(context.get_current_word)

            if result != context.get_current_word
              removed_part = context.get_current_word.sub(result, '')

              removal = Removal.new(context.get_current_word, result, removed_part, 'DP')

              context.add_removal(removal)
              context.set_current_word(result)
            end
          end

          def remove(word)
            word.sub(/^(di|ke|se)/, '')
          end
        end
      end
    end
  end
end
