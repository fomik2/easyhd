class AddColumsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :initiator, :string
    add_column :requests, :responsible, :string
    add_column :requests, :division, :string
    add_column :requests, :status, :string, default: "Новая"
    add_column :requests, :sla_id, :integer
    add_column :requests, :user_id, :integer
    add_column :requests, :department_id, :integer
    add_column :requests, :comment, :text
    add_column :requests, :sla_number, :integer
    add_column :requests, :deadline, :time
  end
end
