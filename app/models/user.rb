class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum usertype: [ :admin, :doctor, :patient]

  has_many :requests
  belongs_to :hospitaltreatment, :inverse_of => :user, optional: true

  
end
