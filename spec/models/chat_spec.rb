require File.dirname(__FILE__) + '/../spec_helper'

describe Chat do
  before :each do
    @chat = Factory.create(:chat)
  end
  
  it "should be valid" do
    @chat.should be_valid
  end

  it "should have a show" do
    @chat.show = nil
    @chat.should_not be_valid
  end

  it "should have a user" do
    @chat.user = nil
    @chat.should_not be_valid
  end

  it "should have a message" do
    @chat.message = nil
    @chat.should_not be_valid
  end
end
