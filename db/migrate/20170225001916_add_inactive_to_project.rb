class AddInactiveToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :inactive, :boolean
  end
end
