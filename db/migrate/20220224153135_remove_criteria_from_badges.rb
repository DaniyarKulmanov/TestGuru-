class RemoveCriteriaFromBadges < ActiveRecord::Migration[6.1]
  def change
    remove_column :badges, :criteria, :string
  end
end
