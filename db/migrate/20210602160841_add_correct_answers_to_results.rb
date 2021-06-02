class AddCorrectAnswersToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :correct_answers, :integer, default: 0
  end
end
