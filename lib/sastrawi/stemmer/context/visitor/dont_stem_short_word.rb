module Sastrawi
  module Stemmer
    module Context
      module Visitor
        class DontStemShortWord
          def visit(context)
            context.stop_process if short_word?(context.current_word)
          end

          def short_word?(word)
            word.length <= 3
          end
        end
      end
    end
  end
end
