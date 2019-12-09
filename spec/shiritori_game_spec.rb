require '../shiritori_game.rb'

RSpec.describe ShiritoriGame do
  describe '.rule' do
    it 'シリトリのルールが表示される' do
      expect(ShiritoriGame.rule).to eq("すべてカタカナで入力してください\n最後に 'ン' がついたら負けです\n同じ単語を使ったら負けです\n")
    end
    describe '.all_words' do
    it { expect(ShiritoriGame.all_words).to eq ["リンゴ", "ゴリラ", "ラッパ", "パリ"] }
    end
  end
  describe '#start' do
    subject(:shiritori_game) { ShiritoriGame.new(player_name: 'シリトリプレイヤー') }
    it { expect(shiritori_game.start).to include("\\_o< Hi, シリトリプレイヤー. Let's enjoy shiritori game\n") }
  end
  describe '#computer_attack' do
    subject(:shiritori_game_computer_attack) { shiritori_game.computer_attack }
    let(:shiritori_game) { ShiritoriGame.new(player_name: 'シリトリプレイヤー') }

    context 'ShiritoriGame#histories 最後が リンゴ のとき' do
      before { shiritori_game.histories << 'リンゴ' }

      it 'ゴリラが返ってくること' do
        expect(shiritori_game_computer_attack).to eq('ゴリラ')
      end
    end

    context 'ShiritoriGame#histories 最後が パリ のとき' do
      before { shiritori_game.histories << 'パリ' }

      it 'リンゴが返ってくること' do
        expect(shiritori_game_computer_attack).to eq('リンゴ')
      end
    end

    context 'ShiritoriGame#histories 最後がリンゴ、ゴリラ、ラッパ、パリ以外の時'do
      before { shiritori_game.histories << "イヌ" }
      # binding.irb
      it 'nilが返ってくること' do
        expect(shiritori_game_computer_attack).to eq(nil)
      end
    end
  end
end
