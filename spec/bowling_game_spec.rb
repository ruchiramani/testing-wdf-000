require_relative 'spec_helper'
require_relative '../lib/bowling_game.rb'

describe Game do

  describe 'Initial Setup' do  #Test 0

    it 'creates a new instance of Game class'  do
      game = Game.new

      expect(game).to be_a(Game)
    end

  end

  describe 'Can roll a gutter game.' do #Test 1
    it 'it returns 0 for a gutter game' do
      game = Game.new

      20.times do
        game.roll(0)
      end

      expect(game.score).to eq(0)
    end
  end

  describe "scores game w/o strikes or spares" do #Test 2
    it 'it returns 20 for all 1s' do
      game = Game.new

      20.times do
        game.roll(1)
      end

      expect(game.score).to eq(20)
    end
  end

  describe 'Can roll a spare' do #Test 3
    it 'it returns the right score for one spare' do
      game = Game.new

      2.times do
        game.roll(5)
      end
      game.roll(3)

      expect(game.score).to eq(16)

    end
  end
  describe 'Can roll a strike' do #Test 4
    it 'it returns the right score for one strike' do
      game = Game.new

      game.roll(10)
      game.roll(3)
      game.roll(4)

      expect(game.score).to eq(24)
    end
  end
  describe 'Can roll a perfect game' do #Test 5
    it 'it returns the right score for all strikes' do
      game = Game.new

      12.times do
      game.roll(10)
      end

      expect(game.score).to eq(300)
    end
  end


end
