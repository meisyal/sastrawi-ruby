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

  it 'should stem "-lah, -kah, -tah, -pun" suffixes' do
    suffixed_words = %w[hancurlah benarkah apatah siapapun]
    base_form = %w[hancur benar apa siapa]
    stemming_result = []

    suffixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem "-ku, -mu, -nya" suffixes' do
    suffixed_words = %w[jubahku bajumu celananya]
    base_form = %w[jubah baju celana]
    stemming_result = []

    suffixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem "-i, -kan, -an" suffixes' do
    suffixed_words = %w[hantui belikan jualan]
    base_form = %w[hantu beli jual]
    stemming_result = []

    suffixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem combination of suffixes' do
    suffixed_words = %w[bukumukah miliknyalah kulitkupun berikanku sakitimu beriannya kasihilah]
    base_form = %w[buku milik kulit beri sakit beri kasih]
    stemming_result = []

    suffixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem plain prefix' do
    plain_prefixed_words = %w[dibuang kesakitan sesuap]
    base_form = %w[buang sakit suap]
    stemming_result = []

    plain_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end

  it 'should stem first rule of derivation prefixes' do
    first_rule_prefixed_words = %w[beradu berambut]
    base_form = %w[adu rambut]
    stemming_result = []

    first_rule_prefixed_words.each do |word|
      stemming_result.push(Sastrawi.stem(word))
    end

    expect((base_form - stemming_result).empty?).to eq(true)
  end
end
