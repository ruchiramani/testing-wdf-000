describe Game, '#hello' do

  let(:game) { Game.new }

  describe Game, 'Test 0' do
    it 'makes a Game instance' do
      expect(game).to be_a(Game)
    end
  end

  describe Game, 'Test 1' do
    it 'Can roll a gutter ball' do
      20.times {game.roll(0)}
      expect(game.score).to eq(0)
    end
  end

  describe Game, 'Test 2' do
    it'Should be able to score a game without strikes or spares' do
      20.times {game.roll(1)}
      expect(game.score).to eq(20)
    end 
  end

  describe Game, 'Test 3' do
    it'Can roll a spare' do
      game.roll(5)
      game.roll(5)
      game.roll(3)
      17.times {game.roll(0)}
      expect(game.score).to eq(16)
    end
  end

  describe Game, 'Test 4' do
    it 'Can roll a strike' do
      game.roll(10)
      game.roll(3)
      game.roll(4)
      18.times {game.roll(0)}
      expect(game.score).to eq(24)
    end
  end

  describe Game, 'Test 5' do
    it 'Can roll a perfect game' do
      12.times {game.roll(10)}
      expect(game.score).to eq(300)
    end
  end

end








