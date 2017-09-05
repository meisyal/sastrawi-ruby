require 'sastrawi/stemmer/context/removal'

##
# Remove derivational suffix
# Asian J. (2007) "Effective Techniques for Indonesian Text Retrieval" page 61
# http://researchbank.rmit.edu.au/eserv/rmit:6312/Asian.pdf

module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemoveDerivationalSuffix
          def visit(context)
            result = remove_suffix(context.current_word)

            if result != context.current_word
              removed_part = context.current_word.sub(/#{Regexp.quote(result)}/, '')

              removal = Sastrawi::Stemmer::Context::Removal.new(self, context.current_word, result, removed_part, 'DS')

              context.add_removal(removal)
              context.current_word = result
            end
          end

          ##
          # Original rule: i|kan|an
          # Added the adopted foreign suffix rule: is|isme|isasi

          def remove_suffix(word)
            word.sub(/(is|isme|isasi|i|kan|an)$/, '')
          end
        end
      end
    end
  end
end
