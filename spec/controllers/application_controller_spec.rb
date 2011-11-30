require 'spec_helper'

describe ApplicationController do
  controller do

    def index
      render :nothing => true
    end
  end

  describe "admin authentication" do
    before :each do
      @user = Factory.create(:user, :admin => true)
    end

    it "should redirect non-logged in users" do
    end
  end
end

