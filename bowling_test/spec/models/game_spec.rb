require 'rails_helper'

describe Game do

  it 'can create a new instance of Game' do  	
  	new_game = Game.new
    expect(new_game).to be_a(Game) 
  end	

  it 'can roll a gutter game' do
  	gutter_game = Game.new
  	20.times { gutter_game.roll(0) }
    
  	expect(gutter_game.score).to eq(0)
  end

  it 'is able to score a game without strikes or spares' do
  	bad_game = Game.new
  	20.times { bad_game.roll(1) }

  	expect(bad_game.score).to eq(20)
  end

  it 'can roll a spare' do
		game = Game.new
  	game.roll(5)
  	game.roll(5)
  	game.roll(3)
  	17.times { game.roll(0)}

  	expect(game.score).to eq(16)
  end

  it 'can roll a strike' do
  	strike_game = Game.new
  	strike_game.roll(10)
  	strike_game.roll(0)
  	strike_game.roll(3)
  	strike_game.roll(4)
  	16.times {strike_game.roll(0)}

  	expect(strike_game.score).to eq(24)
  end

  it 'can roll a perfect game' do
  	perfect_game = Game.new
  	perfect_game.roll(10)
  	perfect_game.roll(0)
  	perfect_game.roll(10)
  	perfect_game.roll(0)
  	perfect_game.roll(10)
  	perfect_game.roll(0)
  	perfect_game.roll(10)
  	perfect_game.roll(0)
  	perfect_game.roll(10)
  	perfect_game.roll(0)
  	perfect_game.roll(10)
  	perfect_game.roll(0)  	
  	perfect_game.roll(10)
  	perfect_game.roll(0)
  	perfect_game.roll(10)
  	perfect_game.roll(0)
  	perfect_game.roll(10)
  	perfect_game.roll(0)
  	perfect_game.roll(10)
  	perfect_game.roll(0)
  	perfect_game.roll(10)
  	perfect_game.roll(10)

  	expect(perfect_game.score).to eq(300)
  end


end
  

