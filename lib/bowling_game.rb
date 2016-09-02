require 'pry'
class Game

  attr_accessor :score
  attr_reader :frame


  def initialize
    @score = 0
    @felled_pins = {1=>[],2=>[],3=>[],4=>[],5=>[],6=>[],7=>[],8=>[],9=>[],10=>[]}
    @frame_number = 1
  end

  def score
    # binding.pry
    if  @felled_pins.values.flatten.all? {|pin| pin == 10}
      sum_score = 300
    else
      sum_score = 0
      @felled_pins.each do |frame_no, frame|
        frame_sum = frame.inject(0) {|sum, i|  sum + i }
        if frame_sum < 10
          sum_score += frame_sum
        else #assume spare
          if frame.size > 1
            sum_score += frame_sum
            sum_score += @felled_pins[frame_no + 1][0]
          else
            sum_score += frame_sum
            sum_score += @felled_pins[frame_no + 1][0]
            if @felled_pins[frame_no + 1].size > 1
              sum_score += @felled_pins[frame_no + 1][1]
            else
              sum_score += @felled_pins[frame_no + 2][0]
            end
          end
        end
      end
      sum_score
    end
  end

  def roll(i)
    # @score += i
    if @frame_number > 10
        @felled_pins[10] << i
    else
      if @felled_pins[@frame_number].empty?  #if yes, then first try
        if i == 10  #strike
          @felled_pins[@frame_number] = [i]
          @frame_number += 1
        else
          @felled_pins[@frame_number] = [i]
        end
      else
        @felled_pins[@frame_number] << i
        @frame_number += 1
      end
    end
    # binding.pry
  end

  def is_strike?

  end

  def is_spare?
  end


end
