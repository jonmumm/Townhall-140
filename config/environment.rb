# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TownHall140::Application.initialize!

Time::DATE_FORMATS[:start_time_format] = "%A, %B %d at %l:%M%p %Z"
