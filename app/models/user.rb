class User < ApplicationRecord
  acts_as_favoritor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :compare_products, dependent: :destroy
  has_many :products, through: :compare_products
end
