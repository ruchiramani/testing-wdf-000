require 'pry'

class Game
  attr_reader :frames
  def initialize
    @frames = Array.new(24,0)
    @count = 0
    @score = 0
  end

  def roll(num)
    # @frames << num
    @frames[@count] = num
    @count += 1
  end

  def score
    # @frames.reduce(:x)
    size = 21 #@frames.size
    i = 0
    @breakpoint = @frames.count(10)
    while i < (size-@breakpoint+1)
      counter = 1
      tmp = 0
      if @frames[i] < 10
        counter = 2
        tmp = @frames[i..(i+1)].reduce(:+)
        if tmp >= 10
          tmp = tmp + @frames[i+2]
        end
      else
        tmp = @frames[i..(i+2)].reduce(:+)
      end
      @score += tmp
      i += counter
    end
    @score
  end

  # attr_accessor :frames
  # def initialize
  #   @frames = []
  #   @bonus = false
  #   @score = 0
  # end

  # def roll(tmp)
  #   if tmp == '/' || tmp == 'x' || tmp == 'X'
  #     @bonus = true
  #   end

  #   if (@frames.size == 10 && @frames.last.size == 2 && !@bonus || @frames.size == 11)
  #     puts "full"
  #     return
  #   end

  #   if tmp.class == Fixnum
  #     if @frames.last.nil? || @frames.last.size == 2
  #       @frames << [tmp]
  #     else
  #       @frames.last << tmp
  #     end
  #   else
  #     if tmp.class == String && tmp.downcase == 'x'
  #       @frames << [ 30, 30 ]
  #     else
  #       @frames.last << 20 if @frames.last.size == 1
  #     end
  #   end
  # end

  # def score
  #   # size = @frames.size
  #   # i = 0
  #   # while ( i < size )
  #   #   i +=1
  #   # end
  # end

  # def print
  #   tmp = []
  #   @frames.each do |x|
  #     if x.include?(20)
  #       tmp << [x.first,'/']
  #     elsif x.include?(30)
  #       tmp << [ 'X' , 'X' ]
  #     else
  #       tmp << x
  #     end
  #   end
  #   tmp.inspect
  # end
end


# r = Game.new

# r.roll(1)
# r.roll(4)
# r.roll(4)
# r.roll(5)
# r.roll(6)
# r.roll('/')
# r.roll(5)
# r.roll('/')
# r.roll('x')

# r.roll(0)
# r.roll(1)
# r.roll(7)
# r.roll('/')
# r.roll(6)
# r.roll('/')
# r.roll('x')
# r.roll(2)
# r.roll('/')

# r.roll(6)
# # r.score
# puts r.print
