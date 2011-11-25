require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  test "should not save without email" do
    subscriber = Subscriber.new
    assert !subscriber.save, "saved the most without an email"
  end

  test "should not save with invalid email" do
    subscriber = Subscriber.new
    subscriber.email = ""
    assert !subscriber.save, "saved with invalid email"
  end
end
