class Request < ApplicationRecord
    belongs_to :users, optional:true

  enum statusd: [:pending, :reject, :accept ]

   #validation here
   validates :user_id, presence: true # must present
 
end
