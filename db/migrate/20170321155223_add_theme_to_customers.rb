class AddThemeToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :theme, :string
  end
end
