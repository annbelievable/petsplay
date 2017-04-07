class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets
  mount_uploader :photo, PhotosUploader

   validates  :first_name, presence: true, on: :update
   validates  :last_name, presence: true, on: :update
   validates  :phone_number, presence: true ,numericality: { only_integer: true }, on: :update
   validates  :address, presence: true, on: :update
   validates  :postcode, presence: true, on: :update
   validates  :city, presence: true, on: :update
   validates  :state, presence: true, on: :update
   validates  :photo, presence: true, on: :update

  validates_integrity_of  :photo
  validates_processing_of :photo
end
