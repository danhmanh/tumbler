class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 6..50 }
  validates :content, presence: true

end
