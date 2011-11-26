require 'spec_helper'

describe "Main" do
  describe "GET /" do
    it "works" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end

    it "should be able to create new subscriber" do
      Subscriber.find_by_email("foo@bar.com").should be_nil

      visit root_path
      fill_in 'subscriber[email]', :with => "foo@bar.com"
      click_button 'Submit'

      Subscriber.find_by_email("foo@bar.com").should_not be_nil
    end
  end
end
