require './spec_helper'

describe Barracks do

  subject(:barracks) do
    Barracks.new
  end

  it 'should have 500 lumber' do
    expect(barracks.lumber).to eq(500)
  end
  
end