require File.dirname(__FILE__) + '/../spec_helper'

describe ChatsController do

  it "should reject chat messages from non-authed users" do
    show = Factory.create(:show)
    post :create, :show_id => show.id, :message => "Foobar"
    response.status.should == 401
  end

  it "should save chat messages and return created" do
    show = Factory.create(:show)
    user = Factory.create(:user)
    sign_in user
    post :create, :show_id => show.id, :message => "Foobar"
    response.status.should == 201
  end
end
