class Rating < ApplicationRecord
  belongs_to :cat, inverse_of: :ratings
end