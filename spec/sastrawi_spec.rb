require 'spec_helper'

describe Sastrawi do
  it 'has a version number' do
    expect(Sastrawi::VERSION).not_to be nil
  end

  it 'should not stem short words' do
    short_words = %w[mei bui]
    base_form = %w[mei bui]
    stemming_result = []

    short_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should not stem "nilai" to "nila"' do
    expect(Sastrawi.stem('nilai')).to eq('nilai')
  end
end
