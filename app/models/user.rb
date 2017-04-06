class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets

  #  validates  :first_name, presence: true
  #  validates  :last_name, presence: true
  #  validates  :phone_number, presence: true
  #  validates  :address, presence: true
  #  validates  :postcode, presence: true
  #  validates  :city, presence: true
  #  validates  :state, presence: true
  #  validates  :photo, presence: true


end
