require './spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  describe "#attack!" do
    let(:robot2) { Robot.new }
    let(:weapon) { PlasmaCannon.new }

    it "attacking a weapon should raise error" do
      expect { robot.attack!(weapon) }.to raise_error
    end
  end

  describe "#heal!" do

    it "healing a dead robot with heal! should raise an error" do
      robot.should_receive(:health).and_return(0)
      expect { robot.heal!(10) }.to raise_error
    end
  end
end