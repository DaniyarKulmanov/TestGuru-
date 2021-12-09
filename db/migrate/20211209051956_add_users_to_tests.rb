class AddUsersToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :users, column: :author_id, null: false, foreign_key: true
  end
end
