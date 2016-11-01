module Sastrawi
  module Stemmer
    module Context
      class Context
        attr_accessor :original_word, :current_word, :dictionary, :visitor_provider

        @@process_is_stopped = false
        @@removal = []
        @@visitors = []
        @@suffix_visitors = []
        @@prefix_visitors = []
        @@result = ''

        def initialize(original_word, current_word, dictionary, visitor_provider)
            @original_word = original_word
            @current_word = current_word
            @dictionary = dictionary
            @visitor_provider = visitor_provider
        end

        def init_visitors
          @@visitors = visitor_provider.get_visitor
          @@suffix_visitors = visitor_provider.get_suffix_visitor
          @@prefix_visitors = visitor_provider.get_prefix_visitor
        end

        def stop_process
            @@process_is_stopped = true
        end

        def add_removal(removal)
            @@removal = removal
        end

        def execute
          self.start_stemming_process

          if dictionary.include?(current_word)
            @@result = current_word
          else
            @@result = original_word
          end
        end

        def start_stemming_process
          # TODO: Implement this method here.
        end

        def remove_prefixes
          (0..3).each do |i|
            self.accept_prefix_visitors(@@prefix_visitors)
            return if dictionary.include?(current_word)
          end
        end

        def remove_suffixes
          self.accept_visitors(@@suffix_visitors)
        end

        def accept(visitor)
          visitor.visit(self)
        end

        def accept_visitors(visitors)
          visitors.each do |visitor|
            self.accept(visitor)

            return current_word if dictionary.include?(current_word)

            return current_word if @@process_is_stopped
          end
        end

        def accept_prefix_visitors(visitors)
          removal_length = removal.size

          visitors.each do |visitor|
            self.accept(visitor)

            return current_word if dictionary.include?(current_word)

            return current_word if @@process_is_stopped

            return if removal.size > removal_length
          end
        end

        def suffix_removal?(removal)
          return removal.get_affix_type == 'DS'
            || removal.get_affix_type == 'PP'
            || removal.get_affix_type == 'P'
        end

        def restore_prefix
          removal.each do |removal|
            if removal.get_affix_type == 'DP'
              current_word = removal.get_subject
              break
            end
          end

          removal.each do |r|
            if r.get_affix_type == 'DP'
              removal.delete(r)
            end
          end
        end
