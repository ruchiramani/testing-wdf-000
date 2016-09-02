class Game

  attr_accessor :score, :game

  def initialize
    @score = 0
    @game = []
  end

  def roll(arg)
    if arg == 10
      @game << [arg]
    elsif arg < 10
      if self.game.last == nil
        @game << [arg]
      elsif !self.game.last.include?(10) && self.game.last.length < 2
        @game.last << arg
      else @game << [arg]
      end
    end
  end

  def score
    i = 0
    self.game.each_with_index do |frame, i|
      frame_points = 0
      if frame == [10]
        # binding.pry
       @score += frame[0] + strike(i)
      elsif (frame[0] + frame[1] == 10)
        @score += (frame[0] + frame[1] + spare(i))
      else @score += (frame[0] + frame[1])
      end
    end
    @score
  end

  def spare(i)
    if rescue_error(i, 1)
      bonus = @game[i+1][0]
    end
    bonus
  end

  def strike(i)
    if !(rescue_error(i, 1) || rescue_error(i, 2))
      bonus = -10
    else
      if game[i+1].length == 2
      bonus = game[i+1][0] + game[i+1][1]
      else
      bonus = game[i+1][0] + game[i+2][0]
      end
    end
    bonus
  end

  def rescue_error(i, add)
    (i + add) < @game.length - 1
  end



end
