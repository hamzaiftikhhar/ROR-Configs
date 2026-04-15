class User < ApplicationRecord

  with_options if: :admin? do
  validates :password, length: { minimum: 10 }
  validates :email_address, presence: true
  end

  has_many :comments, as: :commentable 
  
  has_secure_password
  has_many :sessions, dependent: :destroy

  has_many :subscriptions
  has_many :products, through: :subscriptions   # we are using the 

  validates :email_address, uniqueness: true
  normalizes :email_address, with: ->(e) { e.strip.downcase }  

end

