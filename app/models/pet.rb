class Pet < ApplicationRecord
  belongs_to :user
  mount_uploaders :photos, PhotosUploader
  serialize :photos, JSON
  include Filterable

  scope :age, -> (age) { where age: age }
  scope :types, -> (types) { where types: types }
  scope :gender, -> (gender) { where gender: gender }
  scope :breed, -> (breed) { where("breed like ?","%#{breed}%")}
  scope :available_datetimes, -> (date) { where available_datetimes: date }
  has_many :favourites
end
