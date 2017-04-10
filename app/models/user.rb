class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets
  mount_uploader :photo, PhotosUploader

  has_many :borrower_matches, foreign_key: 'owner_id', class_name: 'Match'
  has_many :borrowers, through: :borrower_matches, source: :borrower

  has_many :owner_matches, foreign_key: 'borrower_id', class_name: "Match"
  has_many :owners, through: :owner_matches, source: :owner

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
