class User < ApplicationRecord
  def test_by_level(level)
    Test.find_by(level: level, author_id: id)
  end
end
