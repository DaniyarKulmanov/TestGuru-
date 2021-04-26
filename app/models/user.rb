class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  def test_by_level(level)
    Test.joins(:results).where(level: level, results: { user_id: :id })
  end
end
