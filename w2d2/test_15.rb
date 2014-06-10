require './spec_helper'

describe SeigeEngine do
  
  subject(:seige_engine) do
    SeigeEngine.new
  end

  subject(:seige_engine2) do
    SeigeEngine.new
  end

  subject(:peasant) do
    Peasant.new
  end

  subject(:footman) do
    Footman.new
  end

  it 'has 50 AP, 500 HP' do
    expect(seige_engine.attack_power).to eq(50)
    expect(seige_engine.health_points).to eq(400)
  end

  it 'can attack anther seige engine' do
    seige_engine2.should_receive(:damage).with(50)
    seige_engine.attack!(seige_engine2)
  end

  it 'cannot attack peasants' do
    seige_engine.attack!(peasant).should be_false
  end

  it 'cannot attack footman' do
    expect(seige_engine.attack!(footman)).to be_false
  end

end