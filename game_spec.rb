require_relative 'spec_helper'

  describe '#Game' do
    it 'keeps track of an games\'s roll and score' do
      # Setup:
      # make the Game instances you need
      player_one = Game.new("Kelene")
    end

    it 'can roll a gutter game' do
      #Player 1 scores a gutter
      player_one = Game.new("Kelene")
      player_one.roll(0)
      expect(player_one.score). to eq(0)
      end

    it 'should be able to score a game without strikes or spares' do
      player_one = Game.new("Kelene")
      i = 0
      while i < 20
        expect(player_one.roll(1)). to eq("Nothing Special!")
        i += 1
      end
      expect(player_one.score). to eq(20)
    end

    it 'can roll a spare' do
      player_one = Game.new("Kelene")
      player_one.roll(5)
      player_one.roll(5)
      player_one.roll(3)
      i = 0
      while i < 17
        player_one.roll(0)
        i += 1
      end
      expect(player_one.score). to eq(16)
    end

    it 'can roll a strike' do
    player_one = Game.new("Kelene")
    player_one.roll(10)
    player_one.roll(3)
    player_one.roll(4)
    expect(player_one.score). to eq(24)
  end


    it 'can roll a perfect game ' do
      player_one = Game.new("Kelene")
      i = 0
      while i < 20
        player_one.roll(10)
        i += 1
      end
      expect(player_one.score). to eq(300)
    end

  end
