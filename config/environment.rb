# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Onlypodcast::Application.initialize!

# My Custom date format
Time::DATE_FORMATS[:xshort] = "%B %d, %Y"

class TrueClass
  def yesno
    "yes"
  end
end

class FalseClass
  def yesno
    "no"
  end
end