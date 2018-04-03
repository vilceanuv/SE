class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|

      t.timestamps

      t.string :qst
      t.boolean :execute_if_real
    end
  end
end
