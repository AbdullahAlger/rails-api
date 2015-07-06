class AddDefaultToListPermissions < ActiveRecord::Migration
  def change
    change_column_default :lists, :permissions, "open"
  end
end
