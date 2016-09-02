class Bowling
  attr_accessor :frame, :frame_count, :previous_frame
  attr_reader :score
  def initialize
    @score = 0
    @frame = []
    @frame_count = 0
    @previous_frame = nil
  end

# => Perfect game
# => Frames  1  2  3  4   5   6   7   8   9   10  11 12
# => Scores  10 10 10 10  10  10  10  10  10  10  10 10
# => Points  30 60 90 120 150 180 210 240 270 300

  def roll(pin_count)
    @frame << pin_count
    case
    when strike
      strike_helper
    when spare
      spare_helper
    else
      if @frame.count == 2 && @previous_frame == "strike"
        # double the whole frame
        self.score = @frame.reduce(:+) * 2
        reset_helper(nil)
      elsif @frame.count == 2 && @previous_frame == "spare"
        # double the first element
        self.score = @frame[0]*2
        reset_helper(nil)
      elsif @frame.count == 2
        # no strike or spare
        self.score = @frame.reduce(:+)
        reset_helper(nil)
      end
    end
  end

  # Spare Methods

  def spare
    @frame.count == 2 && @frame.reduce(:+) == 10
  end

  def spare_helper
    if @previous_frame == "strike"
      self.score = @frame.reduce(:+) * 2
    elsif @previous_frame == "spare"
      self.score = @frame[0]
    else
      self.score = @frame.reduce(:+)
    end
    reset_helper("spare")
  end

  # Strike Methods

  def strike
    @frame.count < 2 && @frame.reduce(:+) == 10
  end

  def strike_helper
    if @previous_frame == "strike" && @frame_count < 10
      self.score = @frame.reduce(:+) * 3
    else
      self.score = @frame.reduce(:+)
    end
    reset_helper("strike")
  end

  def reset_helper(frame_type)
    self.frame.clear
    self.frame_count += 1
    self.previous_frame = frame_type
  end

  def score=(score)
    @score += score
  end

end
