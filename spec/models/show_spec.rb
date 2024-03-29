require 'spec_helper'

describe Show do
  before (:each) do
    @show = Factory.create(:show)
  end
  
  after (:each) do
    @show.destroy unless @show.new_record?
  end

  it "should be valid" do
    @show.should be_valid
  end

  it "should generate a session_id" do
    @show.session_id.should_not be_nil
  end

  it "should have a user" do
    @show.user = nil
    @show.should_not be_valid
  end

  it "should not be valid witout start_time" do
    @show.start_time = nil
    @show.should_not be_valid
  end

    
  it "should be true if show belongs to user" do
    @show.user_is_moderator(@show.user).should be_true
  end

  it "should be true if user is an admin" do
    user = Factory.create(:user, :admin => true)
    @show.user_is_moderator(user).should be_true
  end

  it "should be false if user is non admin, non owner" do
    user = Factory.create(:user)
    @show.user_is_moderator(user).should be_false
  end

  describe "Next" do
    
    before :each do
      Show.destroy_all
    end

    after :each do
      Show.destroy_all
    end

    it "should return a show" do
      Factory.create(:show)
      Show.next.should_not be_empty
    end

    it "should return none" do
      Show.next.should be_empty
    end

    it "should not return shows from more 2 hours ago on" do
      Factory.create(:show, :start_time => Time.now.advance(:hours => -3))
      Show.next.should be_empty
    end

    it "should return shows from 1 hour ago on" do
      Factory.create(:show, :start_time => Time.now.advance(:hours => -1))
      Show.next.should_not be_empty
    end

    it "should return the next show first" do
      show1 = Factory.create(:show)
      show2 = Factory.create(:show, :start_time => Time.now.advance(:hours => 2))
      Show.next.first.should eql show1
    end
  end
end
