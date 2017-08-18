##
# Remove plain prefix
# Asian J. (2007) "Effective Techniques for Indonesian Text Retrieval" page 61
# http://researchbank.rmit.edu.au/eserv/rmit:6312/Asian.pdf

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

          ##
          # Remove plain prefix: di|ke|se

          def remove(word)
            word.sub(/^(di|ke|se)/, '')
          end
        end
      end
    end
  end
end
