class Treatment < ApplicationRecord
    has_many :hospitaltreatments, dependent: :delete_all
    has_many :hospitals, through: :hospitaltreatments
    accepts_nested_attributes_for :hospitals

    validates :name, presence: true

end
