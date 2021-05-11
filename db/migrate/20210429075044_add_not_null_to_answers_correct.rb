class AddNotNullToAnswersCorrect < ActiveRecord::Migration[6.1]
  def change
    change_column_null :answers, :correct, false
    change_column_default :answers, :correct, from: true, to: false
  end
end
