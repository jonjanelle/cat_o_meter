class Rating < ApplicationRecord
  belongs_to :cat, inverse_of: :ratings
  validates_presence_of :user_id, :cat_id, :rating

end
