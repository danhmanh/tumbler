class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 6..20 }
  validates :content, presence: true
  has_many :comments

end
