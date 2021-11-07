class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :url, :hash, presence: true
end
