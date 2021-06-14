class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :housecoins 
  has_many :realestates
  has_many :charges 
  has_many :orders ,through: :charges
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
