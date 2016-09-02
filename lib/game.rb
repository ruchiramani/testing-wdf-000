# Esmery Corniel and Parmanand Sahadeo
# Bowling TDD Lab
# 09/02/16
require 'pry'
class Game

  attr_accessor :turn, :score_array, :final_array


  def initialize
    @score_array = []
    @final_array = []
  end

  def score()
    calculate_score
    final_array.inject(0){|sum,x|sum += x}
  end

  def calculate_score
    i = 0
    j = 0
    while (i < score_array.length - 2)
      if score_array[i] == 10 || score_array[i] + score_array[i+1] == 10
        strike_spare_calc(i, j)
        score_array[i] == 10 ? i += 1 : i += 2
      else
        final_array[j] = score_array[i] + score_array[i+1] 
        if score_array[i+2] != nil && score_array[i+3] != nil
          final_array[j+1] = score_array[i+2] + score_array[i+3]
        end
        i += 2
      end
      j += 1  
    end
  end

  def strike_spare_calc(i, j)
    final_array[j] = score_array[i] + score_array[i+1] + score_array[i+2]
  end


  def roll(pins_knocked)
    score_array << pins_knocked
  end


end
