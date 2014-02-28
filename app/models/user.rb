class User < ActiveRecord::Base
	has_secure_password
	validates :nombre, presence: true, uniqueness: true
	validates_presence_of :password, :on => :create
end
