class Gasto < ActiveRecord::Base
	belongs_to :cliente

	def self.mios(user_id)
		where(:user_id => user_id)
	end

	def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
    end
  end
end
end
