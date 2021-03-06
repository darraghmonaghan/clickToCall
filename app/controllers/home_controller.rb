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
		account_sid = ENV["TWILIO_ACCOUNT_SID"]
		auth_token = ENV["TWILIO_AUTH_TOKEN"]
		@client = Twilio::REST::Client.new(account_sid, auth_token)

		call = @client.account.calls.create(
			:url => "https://handler.twilio.com/twiml/EH4908e9b4eb9c57d84abc9e3a2bdcfe8a",
		    :to => @listener,
		    :from => '+15005550006')


		#@caller_id = @client.account.outgoing_caller_ids.get(account_sid)
		#puts @caller_id.phone_number

		
	end

end
