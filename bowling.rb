require 'pry'

class Game
  attr_accessor :name, :current_score, :turn, :spare, :strike, :strike_ary
  def initialize(name)
    self.name = name
    self.current_score = 0
    self.turn = []
    self.spare = false
    self.strike = false
    self.strike_ary = []
  end

  def play
    Random.new_seed
    roll(new_play.rand(0..10))
  end

  def roll(knocked_down)

    if self.current_score == 300
      exit
    end

    if self.spare == true
      knocked_down += knocked_down
      self.spare = false
    end

    if self.strike == true
      self.strike_ary << knocked_down
      if self.strike_ary.length == 2
        doubled_value = self.strike_ary[0] + self.strike_ary[1]
        self.current_score += doubled_value
        self.strike_ary.clear
        self.strike = false
      end
    end


    self.current_score += knocked_down
    self.turn << knocked_down

    if knocked_down == 0
      return "gutter"
    elsif knocked_down == 10
      self.strike = true
      return "strike"
    elsif self.turn.length == 2
      if self.turn[0] + self.turn[1] == 10
        self.spare = true
        return "spare"
      else
        return "Nothing Special!"
      end
      self.turn.clear
    else
      return "Nothing Special!"
    end
  end

  def score
    self.current_score
  end

end
