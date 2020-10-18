class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :delivery_destinations
  has_many :orders
  has_many :cart_items
  has_many :items, through: :cart_items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
