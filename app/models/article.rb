class Article < ApplicationRecord
  belongs_to :user
  belongs_to :state
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end
