require_relative('contact.rb')
require_relative('rolodex.rb')
require 'sinatra'

$rolodex= Rolodex.new

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

