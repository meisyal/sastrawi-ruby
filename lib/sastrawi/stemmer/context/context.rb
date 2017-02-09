require 'sastrawi/stemmer/confix_stripping/precedence_adjustment_specification'

module Sastrawi
  module Stemmer
    module Context
      class Context
        attr_accessor :original_word, :current_word, :dictionary, :visitor_provider, :process_is_stopped, :removals, :visitors, :suffix_visitors, :prefix_visitors, :result

        def initialize(original_word, dictionary, visitor_provider)
            @original_word = original_word
            @current_word = original_word
            @dictionary = dictionary
            @visitor_provider = visitor_provider

            @process_is_stopped = false
            @removals = []
            @visitors = []
            @suffix_visitors = []
            @prefix_visitors = []
            @result = ''

            init_visitors
        end

        def init_visitors
          @visitors = @visitor_provider.visitors
          @suffix_visitors = @visitor_provider.suffix_visitors
          @prefix_visitors = @visitor_provider.prefix_visitors
        end

        def stop_process
          @process_is_stopped = true
        end

        def add_removal(removal)
          @removals.push(removal)
        end

        def execute
          start_stemming_process

          if @dictionary.contains?(@current_word)
            @result = @current_word
          else
            @result = @original_word
          end
        end

        def start_stemming_process
          return if @dictionary.contains?(@current_word)

          accept_visitors(@visitors)

          return if @dictionary.contains?(@current_word)

          cs_precendence_adjustment_specification = Sastrawi::Stemmer::ConfixStripping::PrecedenceAdjustmentSpecification.new

          if cs_precendence_adjustment_specification.satisfied_by?(@original_word)
            remove_prefixes
            return if @dictionary.contains?(@current_word)

            remove_suffixes
            if @dictionary.contains?(@current_word)
              return
            else
              @current_word = @original_word
              @removals = []
            end

            remove_suffixes
            return if @dictionary.contains?(@current_word)

            remove_prefixes
            return if @dictionary.contains?(@current_word)

            loop_last_return
          end
        end

        def loop_last_return
          restore_prefix

          removals = @removals
          reversed_removals = removals.reverse
          current_word = @current_word

          reversed_removals.each do |reverse_removal|
            next unless suffix_removal?(reverse_removal)

            if reverse_removal.removed_part == 'kan'
              @current_word = reverse_removal.result << 'k'

              remove_prefixes
              return if @dictionary.contains?(@current_word)

              @current_word = reverse_removal.result << 'kan'
            else
              @current_word = reverse_removal.subject
            end

            remove_prefixes
            return if @dictionary.contains?(@current_word)

            @removals = removals
            @current_word = current_word
          end
        end

        def remove_prefixes
          3.times do
            accept_prefix_visitors(@prefix_visitors)

            return if @dictionary.contains?(@current_word)
          end
        end

        def remove_suffixes
          accept_visitors(@suffix_visitors)
        end

        def accept(visitor)
          visitor.visit(self)
        end

        def accept_visitors(visitors)
          visitors.each do |visitor|
            accept(visitor)

            return @current_word if @dictionary.contains?(@current_word)

            return @current_word if @process_is_stopped
          end
        end

        def accept_prefix_visitors(visitors)
          removal_length = @removals.length

          visitors.each do |visitor|
            accept(visitor)

            return @current_word if @dictionary.contains?(@current_word)

            return @current_word if @process_is_stopped

            return if @removals.length > removal_length
          end
        end

        def suffix_removal?(removal)
          removal.affix_type == 'DS' || removal.affix_type == 'PP' || removal.affix_type == 'P'
        end

        def restore_prefix
          @removals.each do |removal|
            if removal.affix_type == 'DP'
              @current_word = removal.subject
              break
            end
          end

          @removals.each do |removal|
            if removal.affix_type == 'DP'
              @removals.delete(removal)
            end
          end
        end
      end
    end
  end
end
