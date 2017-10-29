class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name



    def self.emails_of_all_intrested_users
    	users = User.where(:receive_email => true).pluck(:email)
    	return users
    end

end
