class AddNullFalseToBadgesCriteria < ActiveRecord::Migration[6.1]
  def change
    change_column_null :badges, :criteria, false
  end
end
