require'pry'
class Game
  attr_accessor :rolls

  def initialize
    @rolls = []
  end

  def roll 
    @roll = Random.rand(0..10)
  end

  def score
    i = 0
    sum = 0
    while i < 16
      sum += self.rolls[i] 
      if self.rolls[i] == 10 && i % 2 == 0 && self.rolls[i + 3] != nil
        if rolls[i + 2] + rolls[i + 4] == 20
          sum += rolls[i + 2] + rolls[i + 4]
        else 
          sum += self.rolls[i + 2] + self.rolls[i + 3]
        end

      elsif (self.rolls[i] + (self.rolls[i + 1] || 0)) == 10 && i % 2 == 0
        sum += self.rolls[i + 2] || 0
      end
      i += 1
    end

    # 240


    if self.rolls[16] == 10
      sum += self.rolls[16] + self.rolls[18] + self.rolls[19]




    elsif self.rolls[16] + self.rolls[17] == 10
      sum += 10 + self.rolls[18]
    else
      sum += self.rolls[16] + self.rolls[17]
    end

    sum += self.rolls[18..20].reduce(:+)
    sum
  end

  def play
    @roll = self.roll

    if @roll == 10 && self.rolls.length % 2 == 0
      if self.rolls.length == 19 && self.rolls[18] == 10
        2.times {|x|self.rolls << self.roll}
      elsif self.rolls.length < 19
        self.rolls << @roll << 0
      end
    else
      if self.rolls.length == 19 
        @roll20 = self.roll
        self.rolls << @roll20
        if self.rolls[18] + sel.rolls.last == 10
          self.rolls << self.roll
        end
      elsif self.rolls.length < 19
        self.rolls << @roll
      end
    end 

  end
end