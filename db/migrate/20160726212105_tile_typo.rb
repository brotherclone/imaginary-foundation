class TileTypo < ActiveRecord::Migration
  def change
    rename_column :projects, :tile, :title
    rename_column :essays, :tile, :title
  end
end
