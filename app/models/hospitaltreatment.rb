class Hospitaltreatment < ApplicationRecord
  belongs_to :hospital
  belongs_to :treatment
  has_one :user, :inverse_of => :hospitaltreatment
end
