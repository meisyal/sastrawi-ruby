module Sastrawi
  module Stemmer
    module Cache
      class ArrayCache
        attr_reader :data

        def initialize
          @data = {}
        end

        def set(key, value)
          @data[key.to_sym] = value
        end

        def get(key)
          @data[key.to_sym] if @data.key?(key.to_sym)
        end

        def has?(key)
          @data.key?(key.to_sym)
        end
      end
    end
  end
end
