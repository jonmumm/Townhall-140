require 'spec_helper'

describe EventsController do

  describe "Create action" do
    
    it "should reject events from non-authed users" do
      show = Factory.create(:show)
      event = Factory.build(:event).attributes.symbolize_keys 
      post :create, :show_id => show.id, :event => event
      response.status.should == 401
    end

    it "should reject events from non-admin, non-owner users" do
      show = Factory.create(:show)
      event = Factory.build(:event).attributes.symbolize_keys 
      sign_in Factory.create(:user)
      post :create, :show_id => show.id, :event => event
      response.status.should == 401
    end

    it "should accept events from show owner user" do
      user = Factory.create(:user)
      show = Factory.create(:show, :user => user)
      event = Factory.build(:event).attributes.symbolize_keys 
      sign_in user
      post :create, :show_id => show.id, :event => event
      response.status.should == 201
    end

    it "should accept events from admin users" do
      user = Factory.create(:user, :admin => true)
      show = Factory.create(:show)
      event = Factory.build(:event).attributes.symbolize_keys 
      sign_in user
      post :create, :show_id => show.id, :event => event
      response.status.should == 201
    end
  end

  private
end
