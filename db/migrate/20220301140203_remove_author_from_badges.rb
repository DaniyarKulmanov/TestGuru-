class RemoveAuthorFromBadges < ActiveRecord::Migration[6.1]
  def change
    remove_reference :badges, :author, foreign_key: { to_table: :users }
  end
end
