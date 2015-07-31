class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :votes, :up?, :up
  end
end
