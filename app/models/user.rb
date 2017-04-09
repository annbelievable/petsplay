class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets
  mount_uploader :photo, PhotosUploader

   validates  :first_name, presence: true, on: :update
# <<<<<<< HEAD
#    validates  :last_name, presence: true
#    validates  :phone_number, presence: true ,numericality: { only_integer: true } , on: :update
#   #  validates  :address, presence: true , on: :update
#    validates  :postcode, presence: true , on: :update
#    validates  :city, presence: true , on: :update
#    validates  :state, presence: true , on: :update
#   #  validates  :photo, presence: true, on: :update

  has_many :borrower_matches, foreign_key: 'owner_id', class_name: 'Match'
  has_many :borrowers, through: :borrower_matches, source: :borrower

  has_many :owner_matches, foreign_key: 'borrower_id', class_name: "Match"
  has_many :owners, through: :owner_matches, source: :owner
# =======
   validates  :last_name, presence: true, on: :update
   validates  :phone_number, presence: true ,numericality: { only_integer: true }, on: :update
   validates  :address, presence: true, on: :update
   validates  :postcode, presence: true, on: :update
   validates  :city, presence: true, on: :update
   validates  :state, presence: true, on: :update
   validates  :photo, presence: true, on: :update
# >>>>>>> 8b4c334a7924ef040d02f36efb21de73bf8a45bb

  validates_integrity_of  :photo
  validates_processing_of :photo
end
