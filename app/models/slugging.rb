module Slugging
  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |a|
      a.name.split(" ").join("-").downcase == slug
    end
  end

end
