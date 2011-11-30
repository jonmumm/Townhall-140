require 'spec_helper'

describe Event do
  before :each do
    @event = Factory.create(:event)
  end

  it "should be valid" do
    @event.should be_valid
  end

  it "should have a show" do
    @event.show = nil
    @event.should_not be_valid
  end

  it "should have a user" do
    @event.user = nil
    @event.should_not be_valid
  end

  it "should have a state" do
    @event.state = nil
    @event.should_not be_valid
  end

  it "should reject invalid states" do
    @event.state = "111"
    @event.should_not be_valid
    @event.state = ""
    @event.should_not be_valid
  end

  it "should have a valid date" do
    @event.state = "guest"
    @event.should be_valid
    @event.state = "host"
    @event.should be_valid
    @event.state = "guest"
    @event.should be_valid
  end
end
