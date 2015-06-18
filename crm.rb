require_relative('contact.rb')
require_relative('rolodex.rb')
require 'sinatra'

$rolodex= Rolodex.new
$rolodex.add_contact(Contact.new("Fernando", "Ikeda", "f_ikeda10@hotmail.com","Bitmaker Labs"))

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

get "/contacts/:id" do
	@contact = $rolodex.find(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

post "/contacts" do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:notes])
	$rolodex.add_contact(new_contact)
	redirect to('/contacts')
end