class Test < ApplicationRecord
  def self.titles(category)
    category_id = Category.find_by(title: category)
    Test.where(category_id: category_id).pluck(:title).sort.reverse
  end
end
