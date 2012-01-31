require File.dirname(__FILE__) + '/../spec_helper'

describe Question do
  before :each do 
    @user = Factory.create(:user)
    @question = Factory.create :question, user:@user

  end

  it "should be valid" do
    @question.should be_valid
  end

  it "should belong to a user" do
    @question.user.should == @user
  end

  it "can have votes" do
    @question.votes.count.should == 0
    @question.votes.create user:@user
    @question.votes.reload.count.should == 1
  end
end
