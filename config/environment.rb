# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TownHall140::Application.initialize!

Time::DATE_FORMATS[:start_time_format] = "%A, %B %d at %l:%M%p %Z"

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '587',
  :authentication => :plain,
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'heroku.com'
}
ActionMailer::Base.delivery_method = :smtp
