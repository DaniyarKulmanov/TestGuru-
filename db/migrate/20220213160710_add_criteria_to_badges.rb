class AddCriteriaToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :criteria, :string
  end
end
