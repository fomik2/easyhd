class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :number_of_employees

      t.timestamps
    end
  end
end
