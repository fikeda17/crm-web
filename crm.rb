require_relative('contact.rb')
require_relative('rolodex.rb')
require 'sinatra'

get "/index" do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index	
end

get "/contacts" do
	@contacts = []
	@contacts << Contact.new("Fernando", "Ikeda", "f_ikeda10@hotmail.com", "Student")
	@contacts << Contact.new("Diego", "Bardelli", "bardellidiego@gmail.com", "Salesperson")
	@contacts << Contact.new("Ivonne", "Uzurriaga", "ivonneuzu@hotmail.com", "Housewife")
	
	erb :contacts
end

get "/contacts/new" do 
	erb :new_contact
end

