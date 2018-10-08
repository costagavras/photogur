class Picture < ApplicationRecord
  def self.oldest_last
    Picture.order("created_at DESC")
  end

  def self.created_1m_before_now
    d = Date.current.months_ago(1)
    Picture.where("created_at < ?", d).order("created_at DESC")
  end

  def self.created_last_month
    d = Date.current.last_month
    Picture.where("created_at > ?", d).order("created_at DESC")
  end

  def self.pictures_created_in_year(year)
      created_in_year = []
      Picture.all.each do |picture|
        if picture.created_at.year == year
          created_in_year << picture
        end
      end
      return created_in_year
  end


  validates :artist, presence: { message: "field must be filled out!" }
  validates :title, length: { in: 3..20, message: " length should be from 3 to 20 chars long!" }
  validates :url, presence: { message: "must be filled out!" }
  validates :url, uniqueness: { message: "is not unique!" }


  belongs_to :user


end
