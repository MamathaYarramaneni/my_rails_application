class BlogPost < ApplicationRecord
  has_many :comments, dependent: :destroy
  before_save :like_count

  private

  def like_count
    if self.likes.nil?
      self.likes = 0
    else
      self.likes = self.likes + 1
    end
  end
end
