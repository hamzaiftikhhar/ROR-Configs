class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options if: :admin? do
  validates :password, length: { minimum: 10 }
  validates :email, presence: true
  end

  has_many :comments, as: :commentable 
  
  has_secure_password 
  has_many :sessions, dependent: :destroy

  has_many :subscriptions
  has_many :products, through: :subscriptions   # we are using the 

  validates :email, uniqueness: true
  normalizes :email, with: ->(e) { e.strip.downcase }  

end