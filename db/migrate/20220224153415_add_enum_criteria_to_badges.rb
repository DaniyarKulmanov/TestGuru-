class AddEnumCriteriaToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :criteria, :integer, default: 0
  end
end
