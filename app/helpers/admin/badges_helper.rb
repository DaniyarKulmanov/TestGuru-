# frozen_string_literal: true

module Admin::BadgesHelper
  def all_images
    images = []
    images_all = Dir.entries('app/assets/images').select { |f| f =~ /.*(png)/}
    (images_all).each_slice(1) {|tuple| images.push(tuple) }
    images
  end

  def categories
    Category.all.collect { |c| [c.title, c.id] }
  end
end
