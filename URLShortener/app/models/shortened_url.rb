class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    var =  SecureRandom.urlsafe_base64(16)
    while ShortenedUrl.exists?(short_url: var)
      var =  SecureRandom.urlsafe_base64(16)
    end
    var
  end

  def self.create!(user, url)
    s_url = ShortenedUrl.random_code
    ShortenedUrl.new(long_url: url, short_url: s_url, user_id: user.id).save
  end

  def submitter
    User.find_by_id(self.user_id)
  end
  
  has_many :visits,
  primary_key: :id,
  foreign_key: :shortenedurl_id, 
  class_name: :Visit

  has_many :visitors, 
  through: :visits,
  source: :visitor
end
