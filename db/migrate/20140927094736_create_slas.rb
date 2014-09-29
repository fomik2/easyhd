class CreateSlas < ActiveRecord::Migration
  def change
    create_table :slas do |t|
      t.integer :sla_value
      t.integer :time_for_deadline

      t.timestamps
    end
  end
end
