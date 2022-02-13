class AddAuthorToBadges < ActiveRecord::Migration[6.1]
  def change
    add_reference :badges, :author, foreign_key: { to_table: :users }
  end
end
