class ShiritoriGame
  attr_accessor :histories


  def initialize(player_name:)
    @histories = []
    @player_name = player_name

  end

  # def histories
  # end

  # def histories=
  # end
  
  def self.rule
    rule_text = ''
    rule_text << "すべてカタカナで入力してください\n"
    rule_text << "最後に 'ン' がついたら負けです\n"
    rule_text << "同じ単語を使ったら負けです\n"
    rule_text
  end

  def self.all_words
    %w[リンゴ ゴリラ ラッパ パリ]
  end

  def computer_attack
    if ShiritoriGame.all_words.include?(@histories.last)
      num = ShiritoriGame.all_words.index(@histories.last)
      if @histories.last == ShiritoriGame.all_words.last
      ShiritoriGame.all_words.first
        else
        ShiritoriGame.all_words[num+1]
      end
    else
      nil
    end
  end

  def start
    "\\_o< Hi, #{@player_name}. Let's enjoy shiritori game\n"
  end

  def validate_shiritori_rule(word)
    return false if word.nil?
    return false if word.split("")[word.length-1] == "ン"
    lastword_size = histories.last.size
      if histories.last.slice(lastword_size-1,1) == word.split("")[0]
        return true
      elsif histories.last.slice(lastword_size-1,1) != word.split("")[0]
        return false
      else return false
      end
    return false if ShiritoriGame.all_words.include?(word)
  end
end
