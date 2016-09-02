require 'pry'
class Game 
  attr_accessor :pins, :lane, :rolls, :frames, :score
  
  def initialize
    @frames = []
    @rolls = []
  end
  
  def roll(pins)
  	if @rolls.size < 2
        @rolls << pins
        if @frames.size == 9
          @frames << @rolls
        end
    else
    	@frames << @rolls.dup
    	@rolls.clear
    	@rolls << pins
    end
  end

  def scoring
  	current_score = 0
  	@frames.each_with_index do |rolls, i|
  		if rolls.first == 10 && i < 9
  			next_two_rolls = @frames[i + 1].inject(:+)
  			  if @frames[i + 1][0] == 10 && i < @frames.size - 2
  			  	next_two_rolls = @frames[i + 1][0] + @frames[i + 2][0]
  			  end
  			current_score += rolls[0]
  			current_score += next_two_rolls
  			elsif rolls.inject(:+) == 10 && i < 9
  			next_value = @frames[i + 1][0]
  			current_score += rolls.inject(:+) + next_value
  		else
  			current_score += rolls.inject(:+)
  		end
  	end
     current_score
  end
  
  def score
  	self.score = scoring
  end

end