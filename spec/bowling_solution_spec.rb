require 'spec_helper'

describe "Bowling basics" do
  describe '#initialize the game' do
    it 'initializes game' do
      game = Bowling.new
      expect(game).to be_a(Bowling)
    end
  end

  describe '#gutter game' do
    it 'returns 0 when all turns are 0' do
      bowling = Bowling.new
      20.times { bowling.roll(0)}
      expect(bowling.score).to eq(0)
    end
  end

  describe '#game with no strike no spare' do
    it 'returns 20 when all turns are 1' do
      bowling = Bowling.new
      20.times { bowling.roll(1)}
      expect(bowling.score).to eq(20)
    end
  end

  describe '#game can roll spares' do
    it 'rolls two 5s, then 3, rest all gutter' do
      bowling = Bowling.new
      2.times { bowling.roll(5)}
      1.times { bowling.roll(3)}
      17.times { bowling.roll(0)}
      expect(bowling.score).to eq(16)
    end
  end

  describe '#game can roll strikes' do
    it 'rolls 1 strike, then a 3, and 4, rest all gutter' do
      bowling = Bowling.new
      1.times { bowling.roll(10)}
      1.times { bowling.roll(3)}
      1.times { bowling.roll(4)}
      17.times { bowling.roll(0)}
      expect(bowling.score).to eq(24)
    end
  end

  describe '#game can roll perfect' do
    it 'rolls 12 strikes, score is 300' do
      bowling = Bowling.new
      12.times { bowling.roll(10)}
      expect(bowling.score).to eq(300)
    end
  end

end
