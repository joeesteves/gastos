class AddUsertoGastos < ActiveRecord::Migration
	def change
		add_column :gastos, :user_id, :integer
		add_index :gastos, :user_id
	end
end
