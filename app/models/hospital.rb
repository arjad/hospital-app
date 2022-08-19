class Hospital < ApplicationRecord
    has_many :hospitaltreatments, dependent: :delete_all
    has_many :treatments, through: :hospitaltreatments
    accepts_nested_attributes_for :treatments


     #validation here
     validates :name, :city, presence: true
     validates :address, length: { minimum: 5 }
     validates :name, uniqueness: { case_sensitive: false }


end
