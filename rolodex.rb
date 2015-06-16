require_relative("contact.rb")

class Rolodex
	@@id = 1000

	def initialize
		@contacts = []
	end

	def add_contact(first_name, last_name, email, notes)
		contact = Contact.new(@@id, first_name, last_name, email, notes)		
		@@id += 1

		@contacts << contact
	end

	def display_info_by_attribute(attribute)
		case attribute
		when "name" then
			@contacts.each do |contact|
				puts "#{contact.first_name} #{contact.last_name}"
			end
		when "email" then
			@contacts.each do |contact|
				puts "#{contact.email}"
			end
		when "notes" then
			@contacts.each do |contact|
				puts "#{contact.notes}"
			end
		end
	end 

	def find_contact(id)
		@f_contact = @contacts.find_all do |contact|
		id == contact.id
		end
		return f_contact
		end
	end

	def disp_contact

	end

	def delete_contact(id_delete)
		@contacts.delete_if{|contact| contact.id == id_delete.to_i}
	end


	def all
		@contacts
	end 

	def edit_last(id, new_last_name)
		edit_L = find_contact(id)
		edit_L.last_name = new_last_name
	end

	def edit_first(id, new_first_name)
		edit_F = find_contact(id)
		edit_F.first_name = new_first_name
	end

	def edit_notes(id, new_last_name)
		edit_N = find_contact(id)
		edit_N.notes = new_notes
	end

	def edit_email(id, new_email)
		edit_E = find_contact(id)
		edit_E.email = new_email
	end
end