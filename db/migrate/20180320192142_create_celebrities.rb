class CreateCelebrities < ActiveRecord::Migration[5.1]
  def change
    create_table :celebrities do |t|

      t.timestamps

      t.boolean :male
      t.boolean :real
      t.boolean :dead
      t.string :domain
      t.integer :age
      t.string :nationality
      t.string :skin_color
      t.string :name
    end
  end
end
