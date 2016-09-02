require 'spec_helper'

describe 'bowling' do

  describe 'initial setup' do
  it 'creates a new instance of Game class' do
    game = Game.new
    expect(game).to be_a(Game)
    end
  end


  describe 'can roll a gutter game' do
  it 'returns score of 0' do
    game = Game.new
    20.times do
      game.roll(0)
      end
    expect(game.score).to eq(0)
    end
  end

  describe 'Should be able to score a game without strikes or spares' do
  it 'returns score of 20' do
    game = Game.new
    20.times do
      game.roll(1)
      end
    expect(game.score).to eq(20)
    end
  end

  describe 'Can roll a spare' do
    it 'returns score of 16' do
      game = Game.new
      game.roll(5)
      game.roll(5)
      game.roll(3)
      17.times do
        game.roll(0)
      end
      expect(game.score).to eq (16)
    end
  end

  describe 'Can roll a strike' do
    it 'returns score of 24' do
      game = Game.new
      game.roll(10)
      game.roll(3)
      game.roll(4)
      16.times do
        game.roll(0)
      end
      expect(game.score).to eq (24)
    end
  end

  describe 'Can roll a perfect game' do
    it 'returns score of 300' do
      game = Game.new
      12.times do
        game.roll(10)
      end
      expect(game.score).to eq (300)
    end
  end


end
