require 'spec_helper'

describe User do
  before :each do
    @user = Factory.create(:user)
  end

  it "should be valid" do
    @user.should be_valid
  end

  it "should have an email" do
    @user.email = nil
    @user.should_not be_valid
  end

  it "should have a first name" do
    @user.first_name = nil
    @user.should_not be_valid
  end
  
  it "should have a last name" do
    @user.last_name = nil
    @user.should_not be_valid
  end

  it "should not be an admin by default" do
    @user.admin.should be_false
  end

  it "should have an admin property" do
    @user.admin = true
    @user.should be_valid
  end
  
  it "should set first and last name" do
    @user.full_name = "My Name"
    @user.first_name.should == "My"
    @user.last_name.should == "Name"
  end

  it "should have a password" do
    @user.password = nil
    @user.should_not be_valid
  end

  it "should not need a password if has authentications" do
    @user.password_required?.should be_true if @user.authentications.empty?
  end
end
