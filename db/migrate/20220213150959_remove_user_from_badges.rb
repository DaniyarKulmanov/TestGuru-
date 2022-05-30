class RemoveUserFromBadges < ActiveRecord::Migration[6.1]
  def change
    remove_reference :badges, :user, null: false, foreign_key: true
  end
end
