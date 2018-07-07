class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 6..50 }
  validates :content, presence: true
  has_many :comments
  belongs_to :user

end
