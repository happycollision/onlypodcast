# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Vagrant::Application.initialize!

# My Custom date format
Time::DATE_FORMATS[:xshort] = "%B %d, %Y"
