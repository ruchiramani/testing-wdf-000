require_relative '../lib/game'
describe "Bolling Game" do
 game = Game.new

 describe 'Initial Setup' do
   it 'Should be able to create a new instance of the Game class.' do
     expect(game.class).to eq(Game)
   end
 end

 describe 'Can roll a gutter game.' do
   it 'A game of all 0\'s should score 0 ( game.score should return 0).' do
     game.rolls = Array.new(22, 0)
     game.play
     expect(game.score).to eq(0)
   end
 end

 describe 'Should be able to score a game without strikes or spares.' do
   it 'The player rolls all 1\'s' do
     game.rolls = Array.new(20, 1) << 0 << 0
     expect(game.score).to eq(20)
   end
 end

 describe 'Can roll a spare.' do
   it 'The player rolls two 5\'s, then a 3, then all gutter balls.' do
     game.rolls = [5,5,3] + Array.new(19, 0)
     expect(game.score).to eq(16)
   end
 end

 describe 'Can roll a strike.' do
   it 'The player rolls a strike, then a 3 and a 4, then all gutter balls.' do
     game.rolls = [10,0,3,4] + Array.new(18, 0)
     
     expect(game.score).to eq(24)
   end
 end

 describe 'Can roll a perfect game.' do
   it 'The player throws 12 stikes.' do
     game.rolls = Array.new(9, [10,0]).flatten << 10 << 10 << 10

     expect(game.score).to eq(300)
   end
 end






end



 

  # describe '.all' do
  #   it 'returns the class variable @@all' do
  #     Song.class_variable_set(:@@all, [])

  #     expect(Song.all).to match_array([])
  #   end
  # end

  # describe '.destroy_all' do
  #   it 'resets the @@all class variable to an empty array' do
  #     Song.class_variable_set(:@@all, ["Song"])

  #     Song.destroy_all
  #     expect(Song.all).to match_array([])
  #   end
  # end

  # describe '#save' do
  #   it 'adds the song instance to the @@all class variable' do
  #     song = Song.new("In an Aeroplane Over the Sea")

  #     song.save

  #     expect(Song.all).to include(song)
  #   end
  # end

  # describe '.create' do
  #   it 'initializes and saves the song' do
  #     song = Song.create("In an Aeroplane Over the Sea")

  #     expect(Song.all).to include(song)
  #   end
  # end
# end
