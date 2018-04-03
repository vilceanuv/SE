class ChangeRealColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :celebrities, :real, :real_person
  end
end
