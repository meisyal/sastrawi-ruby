##
# Remove inflectional possessive pronoun
# Asian J. (2007) "Effective Techniques for Indonesia Text Retrieval" page 60
# http://researchbank.rmit.edu.au/eserv/rmit:6312/Asian.pdf

module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class RemoveInflectionalPossessivePronoun
          def visit(context)
            result = remove(context.current_word)

            if result != context.current_word
              removed_part = context.current_word.sub(/#{Regexp.quote(result)}/, '')

              removal = Removal.new(self, context.current_word, result, removed_part, 'PP')

              context.add_removal(removal)
              context.current_word = result
            end
          end

          ##
          # Remove inflectional possessive pronoun: ku|mu|nya|

          def remove(word)
            word.sub(/-*(ku|mu|nya)$/, '')
          end
        end
      end
    end
  end
end
