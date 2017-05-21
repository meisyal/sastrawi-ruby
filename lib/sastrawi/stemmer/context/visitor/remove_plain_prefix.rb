module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemovePlainPrefix
          def visit(context)
            result = remove(context.current_word)

            if result != context.current_word
              removed_part = context.current_word.sub(/#{Regexp.quote(result)}/, '')

              removal = Removal.new(self, context.current_word, result, removed_part, 'DP')

              context.add_removal(removal)
              context.current_word = result
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
