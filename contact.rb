class Contact
	attr_accessor :id, :first_name, :last_name, :email, :notes
	
	def initialize(first_name, last_name, email, notes)
		@first_name = first_name.capitalize
		@last_name = last_name.capitalize
		@email = email
		@notes = notes 
	end

	def one_contact
		puts "ID #{@id}"
		puts "First_name #{@first_name}"
		puts "Last_name #{@last_name}"
		puts "Email: #{@email}"
		puts "Notes: #{notes}"
	end
end


