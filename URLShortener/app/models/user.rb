class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  has_many :visits_obj,
    primary_key: :id, 
    foreign_key: :user_id,
    class_name: :Visit

  has_many :visited_urls,
   through: :visits_obj, 
   source: :address 
end