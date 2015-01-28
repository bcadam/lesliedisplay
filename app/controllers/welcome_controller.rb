class WelcomeController < ApplicationController

def entrance

	require 'date'
	require 'open-uri'
	require 'json'
	require 'nokogiri'

	@staff = Staff.all

	@signup = Signup.new

	#@length = @staff.length

	source = "http://events.nyu.edu/live/json/events/group/entrepreneurial-institute" # + "/tags/elab"
	doc = Nokogiri::HTML(open(source))
	@decoded_array = ActiveSupport::JSON.decode(doc)

	@client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = "ufiikpyTeIgjtCkn5ZA8uR5R1"
	  config.consumer_secret     = "8W087rnVXt1pt9yFkNHhdyLSSjwygZwnaDzHdiZpzO5cFAKuBP"
	  config.access_token        = "312687274-cgUbAJnalxF1LWWQzI495eCegVLMeWxJF492v3F9"
	  config.access_token_secret = "APVSt4P9WHo7iI1PCxkMh3igTDH6bh2zImsXdP4rpG9UU"
	end

	@client.search("#ruby -rt", lang: "en")


render layout: "layouts/jerrylayout"
	
end

def events

	require 'date'
	require 'open-uri'
	require 'json'
	require 'nokogiri'

	@staff = Staff.all

	@signup = Signup.new

	#@length = @staff.length

	source = "http://events.nyu.edu/live/json/events/group/entrepreneurial-institute" # + "/tags/elab"
	doc = Nokogiri::HTML(open(source))
	@decoded_array = ActiveSupport::JSON.decode(doc)

	@client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = "ufiikpyTeIgjtCkn5ZA8uR5R1"
	  config.consumer_secret     = "8W087rnVXt1pt9yFkNHhdyLSSjwygZwnaDzHdiZpzO5cFAKuBP"
	  config.access_token        = "312687274-cgUbAJnalxF1LWWQzI495eCegVLMeWxJF492v3F9"
	  config.access_token_secret = "APVSt4P9WHo7iI1PCxkMh3igTDH6bh2zImsXdP4rpG9UU"
	end

	@client.search("#ruby -rt", lang: "en")

	# require 'rubygems' # not necessary with ruby 1.9 but included for completeness
	# require 'twilio-ruby'

	# # put your own credentials here
	# account_sid = 'AC5152b74d981f442aa54ad1c4dc44497e'
	# auth_token = '1cea798539ce0711ecfe8cba1807035f'

	# # set up a client to talk to the Twilio REST API
	# @twilioclient = Twilio::REST::Client.new account_sid, auth_token

	# # alternatively, you can preconfigure the client like so
	# Twilio.configure do |config|
	#   config.account_sid = account_sid
	#   config.auth_token = auth_token
	# end

	# # and then you can create a new client without parameters
	# @twilioclient = Twilio::REST::Client.new

	# @twilioclient.messages.create(
	#   from: '+16464488668',
	#   to: '+13037480713',
	#   body: 'Your meeting is here!'
	# )

end

def text()

	    @phone = params[:phone]

	require 'rubygems' # not necessary with ruby 1.9 but included for completeness
	require 'twilio-ruby'

	# put your own credentials here
	account_sid = 'AC5152b74d981f442aa54ad1c4dc44497e'
	auth_token = '1cea798539ce0711ecfe8cba1807035f'

	# set up a client to talk to the Twilio REST API
	@twilioclient = Twilio::REST::Client.new account_sid, auth_token

	# alternatively, you can preconfigure the client like so
	Twilio.configure do |config|
	  config.account_sid = account_sid
	  config.auth_token = auth_token
	end

	# and then you can create a new client without parameters
	@twilioclient = Twilio::REST::Client.new

	@twilioclient.messages.create(
	  from: '+16464488668',
	  to: @phone,
	  body: 'Your meeting is here!'
	)

	redirect_to root_url, :notice => ( "Your text has been sent" )

end


end
