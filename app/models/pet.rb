class Pet < ApplicationRecord
  belongs_to :user
  has_many :favourites
  mount_uploaders :photos, PhotosUploader

  include Filterable
  scope :age, -> (age) { where age: age }
  scope :types, -> (types) { where types: types }
  scope :gender, -> (gender) { where gender: gender }
  scope :breed, -> (breed) { where("breed like ?","%#{breed}%")}
  scope :available_datetimes, -> (date) { where available_datetimes: date }
end
