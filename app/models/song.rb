class Song < ActiveRecord::Base
  # extend Slugging
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |a|
      a.name.split(" ").join("-").downcase == slug
    end
  end

end
