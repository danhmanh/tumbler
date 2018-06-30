class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 6..20 }
  validates :content, presence: true

end
