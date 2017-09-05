##
# Remove inflectional particle
# Asian J. (2007) "Effective Techniques for Indonesian Text Retrieval" page 60
# http://researchbank.rmit.edu.au/eserv/rmit:6312/Asian.pdf

module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemoveInflectionalParticle
          def visit(context)
            result = remove(context.current_word)

            if result != context.current_word
              removed_part = context.current_word.sub(/#{Regexp.quote(result)}/, '')

              removal = Removal.new(self, context.current_word, result, removed_part, 'P')

              context.add_removal(removal)
              context.current_word = result
            end
          end

          ##
          # Remove inflectional particle: lah|kah|tah|pun

          def remove(word)
            word.sub(/-*(lah|kah|tah|pun)$/, '')
          end
        end
      end
    end
  end
end
