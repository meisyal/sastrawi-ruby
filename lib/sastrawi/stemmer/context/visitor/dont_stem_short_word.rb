module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class DontStemShortWord
          def visit(context)
            return context.stop_process if self.short_word?(context.get_current_word)
          end

          def short_word?(word)
            word.length <= 3
          end
        end
      end
    end
  end
end
