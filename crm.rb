require_relative 'contact'
require 'sinatra'

get "/index" do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index	
end

get "/contacts" do
	erb :contacts
end

get "/contacts/new" do 
	erb :new_contact
end

