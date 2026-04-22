class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true #polymorphic association allows a model to belong to more than one other model on a single association. In this case, the Comment model can belong to any model that is designated as "commentable". The commentable_type column in the comments table will store the name of the associated model (e.g., "Product", "User", etc.), and the commentable_id column will store the ID of the associated record. This allows us to create comments for different types of models without needing to create separate comment models for each type.
  
  validates :body, presence: true, length: { minimum: 5 } #validates that the body attribute of a comment is present and has a minimum length of 5 characters. This ensures that comments cannot be created without content and that they have a reasonable length.
end
