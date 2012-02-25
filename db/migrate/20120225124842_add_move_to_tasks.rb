class AddMoveToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :moveto, :integer
  end
end
