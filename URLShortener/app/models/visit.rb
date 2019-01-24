class Visit < ApplicationRecord
  validates :user_id, presence: true
  validates :shortenedurl_id, presence: true

  def self.record_visit!(user, shortened_url) #we are passing in two objects to create a visit object.
    Visit.new(user_id: user.id, shortenedurl_id: shortened_url.id).save #we look at the tables to see what values it takes in
  end
  
  belongs_to :visitor,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :address,
  primary_key: :id,
  foreign_key: :shortenedurl_id,
  class_name: :ShortenedUrl

end
