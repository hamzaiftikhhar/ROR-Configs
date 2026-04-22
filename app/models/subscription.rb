class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :product

    validate :user_cannot_subscribe_twice

  def user_cannot_subscribe_twice #this is the custom validation method that checks
    if Subscription.exists?(user_id: user_id, product_id: product_id)
      errors.add(:base, "Already subscribed to this product")
    end
  end
end
