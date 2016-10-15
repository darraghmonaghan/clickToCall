class HomeController < ApplicationController

	def index
	end

	def dial

		@listener = params[:call][:listener]
		@speaker = params[:call][:speaker]

		puts @listener
		puts @speaker

		# Get twilio-ruby from twilio.com/docs/ruby/install
		require 'rubygems'          # This line not needed for ruby > 1.8
		require 'twilio-ruby'

		# Get your Account Sid and Auth Token from twilio.com/user/account
		account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
		auth_token = 'your_auth_token'
		@client = Twilio::REST::Client.new account_sid, auth_token

		call = @client.account.calls.create(:url => "localhost:3000/twiml",
		    :to => @listener,
		    :from => "+15017250604",
		    :sendDigits => @speaker)
		


	end

end
