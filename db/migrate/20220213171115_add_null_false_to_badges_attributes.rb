class AddNullFalseToBadgesAttributes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :badges, :name, false
    change_column_null :badges, :filename, false
  end
end
