module Sastrawi
  module Stemmer
    module Context
      class Removal
        attr_accessor :visitor, :subject, :result, :removed_part, :affix_type

        def initialize(visitor, subject, result, removed_part, affix_type)
          @visitor = visitor
          @subject = subject
          @result = result
          @removed_part = removed_part
          @affix_type = affix_type
        end
      end
    end
  end
end
