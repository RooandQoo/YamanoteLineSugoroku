class AddPasswordToTemas < ActiveRecord::Migration
  def change
    add_column :teams, :password, :string
  end
end
