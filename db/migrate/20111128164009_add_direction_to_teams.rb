class AddDirectionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :direction, :boolean
  end
end
