require 'spec_helper'

module Sastrawi
  module Stemmer
    describe StemmerFactory do
      let :stemmer_factory do
        StemmerFactory.new
      end

      let :stemmer do
        stemmer_factory.create_stemmer
      end

      let :extra_dictionary do
        stemmer_factory.create_default_dictionary
      end

      let :additional_word do
        'internet'
      end

      let :stemmer_with_extra_dictionary do
        Stemmer.new(extra_dictionary)
      end

      def add_word_to_dictionary(dictionary, words)
        dictionary.add(words)
      end

      context 'with default dictionary' do
        it 'should not stem short words' do
          short_words = %w[mei bui]
          base_form = %w[mei bui]
          stemming_result = []

          short_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should not stem "nilai" to "nila"' do
          expect(stemmer.stem('nilai')).to eq('nilai')
        end

        it 'should stem "-lah, -kah, -tah, -pun" suffixes' do
          suffixed_words = %w[hancurlah benarkah apatah siapapun]
          base_form = %w[hancur benar apa siapa]
          stemming_result = []

          suffixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem "-ku, -mu, -nya" suffixes' do
          suffixed_words = %w[jubahku bajumu celananya]
          base_form = %w[jubah baju celana]
          stemming_result = []

          suffixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem "-i, -kan, -an" suffixes' do
          suffixed_words = %w[hantui belikan jualan]
          base_form = %w[hantu beli jual]
          stemming_result = []

          suffixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem combination of suffixes' do
          suffixed_words = %w[
            bukumukah miliknyalah kulitkupun berikanku
            sakitimu beriannya kasihilah
          ]
          base_form = %w[buku milik kulit beri sakit beri kasih]
          stemming_result = []

          suffixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem plain prefix' do
          plain_prefixed_words = %w[dibuang kesakitan sesuap]
          base_form = %w[buang sakit suap]
          stemming_result = []

          plain_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem first rule of derivation prefixes' do
          first_rule_prefixed_words = %w[beradu berambut]
          base_form = %w[adu rambut]
          stemming_result = []

          first_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem second rule of derivation prefixes' do
          expect(stemmer.stem('bersuara')).to eq('suara')
        end

        it 'should stem third rule of derivation prefixes' do
          expect(stemmer.stem('berdaerah')).to eq('daerah')
        end

        it 'should stem fourth rule of derivation prefixes' do
          expect(stemmer.stem('belajar')).to eq('ajar')
        end

        it 'should stem fifth rule of derivation prefixes' do
          fifth_rule_prefixed_words = %w[bekerja beternak]
          base_form = %w[kerja ternak]
          stemming_result = []

          fifth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem sixth rule of derivation prefixes' do
          sixth_rule_prefixed_words = %w[terasing teraup]
          base_form = %w[asing raup]
          stemming_result = []

          sixth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem seventh rule of derivation prefixes' do
          expect(stemmer.stem('tergerak')).to eq('gerak')
        end

        it 'should stem eighth rule of derivation prefixes' do
          expect(stemmer.stem('terpuruk')).to eq('puruk')
        end

        it 'should stem ninth rule of derivation prefixes' do
          expect(stemmer.stem('teterbang')).to eq('terbang')
        end

        it 'should stem tenth rule of derivation prefixes' do
          tenth_rule_prefixed_words = %w[melipat meringkas mewarnai meyakinkan]
          base_form = %w[lipat ringkas warna yakin]
          stemming_result = []

          tenth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem eleventh rule of derivation prefixes' do
          eleventh_rule_prefixed_words = %w[membangun memfitnah memvonis]
          base_form = %w[bangun fitnah vonis]
          stemming_result = []

          eleventh_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem twelfth rule of derivation prefixes' do
          twelfth_rule_prefixed_words = %w[memperbarui mempelajari]
          base_form = %w[baru ajar]
          stemming_result = []

          twelfth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem thirteenth rule of derivation prefixes' do
          thirteenth_rule_prefixed_words = %w[meminum memukul]
          base_form = %w[minum pukul]
          stemming_result = []

          thirteenth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem fourteenth rule of derivation prefixes' do
          fourteenth_rule_prefixed_words = %w[mencinta mendua menjauh menziarah]
          base_form = %w[cinta dua jauh ziarah]
          stemming_result = []

          fourteenth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem fifteenth rule of derivation prefixes' do
          fifteenth_rule_prefixed_words = %w[menuklir menangkap]
          base_form = %w[nuklir tangkap]
          stemming_result = []

          fifteenth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem sixteenth rule of derivation prefixes' do
          sixteenth_rule_prefixed_words = %w[menggila menghajar mengqasar]
          base_form = %w[gila hajar qasar]
          stemming_result = []

          sixteenth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem seventeenth rule of derivation prefixes' do
          seventeenth_rule_prefixed_words = %w[mengudara mengupas]
          base_form = %w[udara kupas]
          stemming_result =[]

          seventeenth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem eighteenth rule of derivation prefixes' do
          expect(stemmer.stem('menyuarakan')).to eq('suara')
        end

        it 'should stem nineteeth rule of derivation prefixes' do
          expect(stemmer.stem('mempopulerkan')).to eq('populer')
        end

        it 'should stem twentieth rule of derivation prefixes' do
          twentieth_rule_prefixed_words = %w[pewarna peyoga]
          base_form = %w[warna yoga]
          stemming_result = []

          twentieth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem twenty-first rule of derivation prefixes' do
          twenty_first_rule_prefixed_words = %w[peradilan perumahan]
          base_form = %w[adil rumah]
          stemming_result = []

          twenty_first_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem twenty-third rule of derivation prefixes' do
          expect(stemmer.stem('permuka')).to eq('muka')
        end

        it 'should stem twenty-fourth rule of derivation prefixes' do
          expect(stemmer.stem('perdaerah')).to eq('daerah')
        end

        it 'should stem twenty-fifth rule of derivation prefixes' do
          twenty_fifth_rule_prefixed_words = %w[pembangun pemfitnah pemvonis]
          base_form = %w[bangun fitnah vonis]
          stemming_result = []

          twenty_fifth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem twenty-sixth rule of derivation prefixes' do
          twenty_sixth_rule_prefixed_words = %w[peminum pemukul]
          base_form = %w[minum pukul]
          stemming_result = []

          twenty_sixth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem twenty-eighth rule of derivation prefixes' do
          twenty_eighth_rule_prefixed_words = %w[penasihat penangkap]
          base_form = %w[nasihat tangkap]
          stemming_result = []

          twenty_eighth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem twenty-ninth rule of derivation prefixes' do
          twenty_ninth_rule_prefixed_words = %w[penggila penghajar pengqasar]
          base_form = %w[gila hajar qasar]
          stemming_result = []

          twenty_ninth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem thirtieth rule of derivation prefixes' do
          thirtieth_rule_prefixed_words = %w[pengudara pengupas]
          base_form = %w[udara kupas]
          stemming_result = []

          thirtieth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem thirtieth-first rule of derivation prefixes' do
          expect(stemmer.stem('penyuara')).to eq('suara')
        end

        it 'should stem thirtieth-second rule of derivation prefixes' do
          thirtieth_second_rule_prefixed_words = %w[pelajar pelabuhan]
          base_form = %w[ajar labuh]
          stemming_result = []

          thirtieth_second_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem thirtieth-fourth rule of derivation prefixes' do
          expect(stemmer.stem('petarung')).to eq('tarung')
        end

        it 'should stem thirtieth-fifth rule of derivation prefixes' do
          expect(stemmer.stem('terpercaya')).to eq('percaya')
        end

        it 'should stem thirtieth-sixth rule of derivation prefixes' do
          thirtieth_sixth_rule_prefixed_words = %w[pekerja peserta]
          base_form = %w[kerja serta]
          stemming_result = []

          thirtieth_sixth_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem modified twelfth and sixteenth rules' do
          modified_rule_prefixed_words = %w[mempengaruhi mengkritik]
          base_form = %w[pengaruh kritik]
          stemming_result = []

          modified_rule_prefixed_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem adjusting rule precedence' do
          adjusting_rule_precedence_words = %w[
            bersekolah bertahan mencapai
            dimulai petani terabai
          ]
          base_form = %w[sekolah tahan capai mulai tani abai]
          stemming_result = []

          adjusting_rule_precedence_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem enhanced confix stripping' do
          enhanced_confix_stripping_words = %w[
            mensyaratkan mensyukuri mengebom mempromosikan
            memproteksi memprediksi pengkajian pengembom
          ]
          base_form = %w[syarat syukur bom promosi proteksi prediksi kaji bom]
          stemming_result = []

          enhanced_confix_stripping_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem loop last return of enhanced confix stripping' do
          loop_last_return_enhanced_confix_stripping_words = %w[
            bersembunyi bersembunyilah pelanggan pelaku
            pelangganmukah pelakunyalah perbaikan kebaikannya
            bisikan menerangi berimanlah memuaskan
            berpelanggan bermakanan
          ]
          base_form = %w[
            sembunyi sembunyi langgan laku langgan laku baik
            baik bisik terang iman puas langgan makan
          ]
          stemming_result = []

          loop_last_return_enhanced_confix_stripping_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem modified enhanced confix stripping' do
          modified_enhanced_confix_stripping_words = %w[
            menyala menyanyikan menyatakannya
            penyanyi penyawaan
          ]
          base_form = %w[nyala nyanyi nyata nyanyi nyawa]
          stemming_result = %w[]

          modified_enhanced_confix_stripping_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem modified enhanced confix stripping with infix' do
          infix_modified_enhanced_confix_stripping_words = %w[
            rerata lelembut lemigas kinerja
          ]
          base_form = %w[rata lembut ligas kerja]
          stemming_result = []

          infix_modified_enhanced_confix_stripping_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem plural words' do
          plural_words = %w[buku-buku berbalas-balasan bolak-balik]
          base_form = %w[buku balas bolak-balik]
          stemming_result = []

          plural_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem combination of prefix and suffix' do
          combination_prefix_suffix_words = %w[
            bertebaran terasingkan membangunkan mencintai
            menduakan menjauhi menggilai pembangunan
          ]
          base_form = %w[tebar asing bangun cinta dua jauh gila bangun]
          stemming_result = []

          combination_prefix_suffix_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'shouldn\'t stem words that are not in the dictionary' do
          words = %w[marwan subarkah]
          base_form = %w[marwan subarkah]
          stemming_result = []

          words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should recursively remove prefix' do
          words = %w[memberdayakan persemakmuran keberuntunganmu kesepersepuluhnya]
          base_form = %w[daya makmur untung sepuluh]
          stemming_result = []

          words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem a sentence' do
          sentence = 'siapakah memberdayakan pembangunan'
          base_form = 'siapa daya bangun'

          expect(stemmer.stem(sentence)).to eq(base_form)
        end

        it 'should stem multiple sentences' do
          sentences = 'Cinta telah bertebaran. Keduanya saling mencintai.'
          base_form = 'cinta telah tebar dua saling cinta'

          expect(stemmer.stem(sentences)).to eq(base_form)
        end

        it 'should stem the issue' do
          words = %w[Perekonomian menahan peranan memberikan medannya]
          base_form = %w[ekonomi tahan peran beri medan]
          stemming_result = []

          words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem adopted foreign suffixes' do
          adopted_foreign_suffix_words = %w[idealis idealisme finalisasi]
          base_form = %w[ideal ideal final]
          stemming_result = []

          adopted_foreign_suffix_words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end

        it 'should stem additional rules of sastrawi' do
          words = %w[
            penstabilan pentranskripsi mentaati meniru-nirukan menyepak-nyepak
            melewati menganga kupukul kauhajar kuasa-Mu malaikat-malaikat-Nya
            nikmat-Ku allah-lah
          ]
          base_form = %w[
            stabil transkripsi taat tiru sepak lewat nganga
            pukul hajar kuasa malaikat nikmat allah
          ]
          stemming_result = []

          words.each do |word|
            stemming_result.push(stemmer.stem(word))
          end

          expect((base_form - stemming_result).empty?).to be true
        end
      end

      context 'with extra dictionary' do
        it 'should stem word that has been added to dictionary' do
          add_word_to_dictionary(extra_dictionary, additional_word)

          expect(stemmer_with_extra_dictionary.stem('internetan')).to eq('internet')
        end
      end
    end
  end
end
