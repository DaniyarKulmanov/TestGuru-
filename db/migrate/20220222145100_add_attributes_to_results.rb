class AddAttributesToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :passed, :boolean, default: false
  end
end
