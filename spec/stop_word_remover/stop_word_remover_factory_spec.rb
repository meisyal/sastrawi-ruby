require 'spec_helper'

require 'sastrawi/stop_word_remover/stop_word_remover'
require 'sastrawi/stop_word_remover/stop_word_remover_factory'

module Sastrawi
  module StopWordRemover
    describe StopWordRemoverFactory do
      let :stop_word_remover_factory do
        StopWordRemoverFactory.new
      end

      it 'should instance of StopWordRemover' do
        expect(stop_word_remover_factory.create_stop_word_remover).to be_an_instance_of(StopWordRemover)
      end
    end
  end
end
