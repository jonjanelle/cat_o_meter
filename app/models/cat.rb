class Cat < ApplicationRecord
  belongs_to :user, inverse_of: :cats
  has_many :ratings, inverse_of: :cat
  mount_uploader :image, CatImageUploader
end
