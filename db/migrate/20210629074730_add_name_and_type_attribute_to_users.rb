class AddNameAndTypeAttributeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    remove_column :users, :name
    add_index :users, :type
  end
end
