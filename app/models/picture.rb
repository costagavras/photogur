class Picture < ApplicationRecord
  def self.oldest_last
    Picture.order("created_at DESC")
  end
  #
  # def self.created_before(time)
  #   Picture.where("created_at < ?", time) #Time.current - 1.month (how to pass an argument?)
  # end

  validates :artist, presence: { message: "field must be filled out!" }
  validates :title, length: { in: 3..20, message: " length should be from 3 to 20 chars long!" }
  validates :url, presence: { message: "must be filled out!" }
  validates :url, uniqueness: { message: "is not unique!" }


  belongs_to :user


end
