class RemoveDeadlineTwoFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :deadline, :time
  end
end
