class AddColumnToWeeks < ActiveRecord::Migration[5.0]
  def change
    add_column :weeks, :proxy_user_id, :integer
    add_column :weeks, :proxy_updated_date, :datetime
  end
end