require 'active_resource'

class RiotMatch < ActiveResource::Base
  include RiotApiResource
  
  self.site = 'https://euw.api.pvp.net/api/lol/euw/v2.2/'
  self.collection_name = 'match'
  self.include_format_in_path = false
  self.logger = Logger.new(STDERR) if Rails.env == 'development'
end
