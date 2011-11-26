require 'spec_helper'

describe Subscriber do
  before :each do
    @sub = Factory.create(:subscriber)
  end

  after :each do
    @sub.destroy unless @sub.new_record?
  end

  it "should be valid" do
    @sub.should be_valid
  end

  it "should have an email" do
    @sub.email = nil
    @sub.should_not be_valid
  end

  it "should have a unique email" do
    sub1 = Subscriber.new
    sub1.email = @sub.email
    sub1.save.should be_false
  end

  it "should have a valid email" do
    @sub.email = "a@"
    @sub.should_not be_valid
    @sub.email = "@"
    @sub.should_not be_valid
    @sub.email = "@asdf.com"
    @sub.should_not be_valid
    @sub.email = "!!!!@///.com"
    @sub.should_not be_valid
    @sub.email = "asdf.com"
    @sub.should_not be_valid
    @sub.email = "a@b"
    @sub.should_not be_valid

    @sub.email = "a@b.com"
    @sub.should be_valid
  end

end
