class Pet < ApplicationRecord
  belongs_to :user
  mount_uploaders :photos, PhotosUploader
end
