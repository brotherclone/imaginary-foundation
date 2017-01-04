class Restart < ActiveRecord::Migration
  def change
    drop_table :essays
    drop_table :images
    drop_table :projects
  end
end
