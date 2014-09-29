class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :request_id
      t.date :deadline
      t.integer :sla

      t.timestamps
    end
  end
end
