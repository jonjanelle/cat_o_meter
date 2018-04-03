class Cat < ApplicationRecord
  belongs_to :user, inverse_of: :cats
  has_many :ratings, inverse_of: :cat
  mount_uploader :image, CatImageUploader

  def average_rating
    ratings = self.ratings.map(&:rating)
    ratings.present? ? ratings.sum.to_f/ratings.count : 0
  end

end
