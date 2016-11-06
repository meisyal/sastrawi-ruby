module Sastrawi
  module Stemmer
    module Cache
      class ArrayCache
        attr_accessor :data

        def initialize
          @data = Hash.new
        end

        def set(key, value)
          @data[key] = value
        end

        def get(key)
          return @data[key] if @data.has_key?(key.to_sym)
        end

        def has(key)
          return key if @data.has_key?(key.to_sym)
        end
      end
    end
  end
end
