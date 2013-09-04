require 'SecureRandom'

class ShortenedUrl < ActiveRecord::Base

  attr_accessible :short_url, :long_url, :user_id

  validate :short_url, :uniqueness => true
  validate :short_url, :presence => true
  validate :long_url, :presence => true
  validate :user_id, :presence => true


  def self.random_code
    random_string = ""
    loop do
      random_string = SecureRandom.urlsafe_base64
      examples = ShortenedUrl.where(:short_url => random_string)
      break if examples.empty?
    end

    random_string
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = self.random_code
    ShortenedUrl.create!(:long_url => long_url, :short_url => short_url,
                        :user_id => user.id)
  end
end
