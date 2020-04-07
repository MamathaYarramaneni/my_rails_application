class TwitterController < ApplicationController
  before_action :authenticate_user!
  def index
	require 'twitter'

	client = Twitter::REST::Client.new do |config|
	  config.consumer_key = "AUHNJbJKyzqk10Sb7QjXuNoMD"
	  config.consumer_secret = "c1bjwh5LS7ezYlSgMjlV7ekcfVOAJSvvhGf2cL5wKsGCBxcdXN"
	  config.access_token = "1171088394413211648-bYHxSb1cTBOYubLI5p6033VWVgcy8M"
	  config.access_token_secret = "GLBYWMcUGk17uRSm3EqJLhhI1JUbSdULT0zQT3BGHozlj"
	end

	@timeline = client.user_timeline("MamathaYarrama1")

  end
end
