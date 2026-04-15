class Product < ApplicationRecord
  include Notifications #Notifications module is included in the Product model, which means that all the methods defined in the Notifications module will be available as instance methods on Product objects. This allows us to keep our code organized and modular, and it also makes it easier to reuse the notification functionality across different models if needed.


  has_many :subscriptions
  has_many :users, through: :subscriptions

  has_many :subscribers, dependent: :destroy
  has_one_attached :featured_image

  has_rich_text :description

  # validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }, on: :create 

  validates :inventory_count, numericality: { greater_than_or_equal_to: 0, message: "%{value} is not valid, should be a positive number" }, on: :create && :update

  validates :name, presence: true, length: { minimum: 2, maximum: 100 } 
 
  validates_each :name do |record, attr, value|  #record is the instance of the model being validated, attr is the name of the attribute being validated (in this case, :name), and value is the actual value of that attribute for the current record. The block will be executed for each record being validated, allowing you to add custom validation logic and error messages as needed.
    if value =~ /\A\d/ 
      record.errors.add(attr, "cannot start with a number")
    end
  end


  

end


