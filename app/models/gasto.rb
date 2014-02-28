class Gasto < ActiveRecord::Base
	belongs_to :cliente

	def self.mios(user_id)
		where(:user_id => user_id)
	end
end
