# frozen_string_literal: true

module Admin::BadgesHelper
  def all_images
    images = []
    images_all = Dir.entries('app/assets/images').select { |f| f =~ /.*(png)/ }
    (images_all).each_slice(1) { |tuple| images.push(tuple) }
    images
  end

  def categories_titles
    Category.all.collect { |c| [c.title, c.id] }
  end

  def tests_titles
    Test.all.collect { |t| [t.title, t.id] }
  end
end
