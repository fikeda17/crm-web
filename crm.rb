require_relative('rolodex.rb')
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

$rolodex= Rolodex.new

class Contact
	include DataMapper::Resource #module this class will represent a single database table 

	property :id, Serial 
	property :first_name, String
	property :last_name, String
	property :email, String
	property :date, Date
	property :notes, Text 
end

DataMapper.finalize #validate any issues with the properties or tables we defined
DataMapper.auto_upgrade! #effecting any changes to the underlying structure of the tables or columns 

get "/index" do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index	
end

get "/contacts" do
	@contacts = Contact.all
	erb :contacts
end

get "/contacts/new" do 
	erb :new_contact
end

get "/contacts/:id" do
	@contact = Contact.get(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

post "/contacts" do
	contact = Contact.create(
			:first_name => params[:first_name],
			:last_name => params[:last_name],
			:email => params[:email],
			:date => params[:date],
			:notes => params[:notes]
		)
	redirect to("/contacts")
end

get "/contacts/:id/edit" do
	@contact = $rolodex.find(params[:id].to_i)
	if @contacts
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

put "/contacts/:id" do
	@contact = $rolodex.find(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.date = params[:date]
		@contact.notes = params[:notes]

		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end

delete "/contacts/:id" do 
	@contact = $rolodex.find(params[:id].to_i)
	if @contact 
		$rolodex.remove_contact(@contact)
		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end


