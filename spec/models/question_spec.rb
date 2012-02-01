require File.dirname(__FILE__) + '/../spec_helper'

describe Question do
  before :each do 
    @user = Factory.create(:user)
    @question = Factory.create :question, user:@user
  end

  it "may belong to a user" do
    @question.user.should == @user end

  it "can have votes" do
    @question.votes.count.should == 0
    @question.votes.create user:@user
    @question.votes.reload.count.should == 1
    @question.votes.create ip:'0.0.0.0'
    @question.votes.reload.count.should == 2
  end

  it "should counter cache vote counts" do
    expect { 
      @question.votes.create! ip:'0.0.0.1'
      @question.reload
    }.to change(@question, :votes_count).by(1) 
  end

  it "should not have more than one vote per ip address" do
    @question.votes.create! ip:'0.0.0.1'
    @question.reload
    expect { 
      @question.votes.create ip:'0.0.0.1'
      @question.reload
    }.to change(@question, :votes_count).by(0) 
  end
  
  it "has a writable author string field" do
    q = Factory.create :question, author: "Monica L", user:nil
    q.author.should == "Monica L"
  end

  it "sets author field from user name of an associated user" do
    @question.author.should == "#{@user.first_name} #{@user.last_name[0]}"
  end

end


