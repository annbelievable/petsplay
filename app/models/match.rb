class Match < ApplicationRecord
  belongs_to :owners, foreign_key: 'owner_id', class_name: 'User'
  belongs_to :borrower, foreign_key: 'borrower_id', class_name: 'User'
  validates  :owners_id, presence: true
  validates  :borrower_id, presence: true
end
