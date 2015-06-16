require 'sinatra'

get "/contacts" do
	erb :contacts
end

get "/" do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index	
end

