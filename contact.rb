class Contact
	attr_accessor :id, :first_name, :last_name, :email, :date, :notes
	
	def initialize(first_name, last_name, email, date, notes)
		@first_name = first_name.capitalize
		@last_name = last_name.capitalize
		@email = email
		@date = date
		@notes = notes 
	end

end


