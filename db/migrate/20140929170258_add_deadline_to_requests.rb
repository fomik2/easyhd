class AddDeadlineToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :deadline, :datetime
  end
end
