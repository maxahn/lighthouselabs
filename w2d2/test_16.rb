require './spec_helper'

describe Barracks do 
  subject(:barracks) { Barracks.new }
  subject(:seige_engine) { SeigeEngine.new }

  describe '#train_seige_engine' do
    it 'trains a new seige engine' do
      seige_engine = barracks.train_seige_engine
      seige_engine.should be_an_instance_of(SeigeEngine)
    end

    it 'cost 200 gold' do
      original_gold = barracks.gold
      barracks.train_seige_engine
      expect(barracks.gold).to eq(original_gold - 200)
    end

    it 'cost 60 lumber' do
      original_lumber = barracks.lumber
      barracks.train_seige_engine
      expect(barracks.lumber).to eq(original_lumber - 60)
    end

    it 'cost 3 food' do
      original_food = barracks.food
      barracks.train_seige_engine
      expect(barracks.food).to eq(original_food - 3)
    end

    describe '#damage' do

      it 'gets 2x damage from seige engine' do  
        original_health = barracks.health_points
        seige_engine.attack!(barracks)
        expect(barracks.health_points).to eq(original_health - 100)
      end
    end
  end
end