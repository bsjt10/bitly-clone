class CreateClickcounter < ActiveRecord::Migration
	def change
	#write table stuffs hereeee
		add_column :urls, :click_counter, :integer
	end
end


