class ExternalUrlRemove < ActiveRecord::Migration
  def change
    remove_column :projects, :external_url
  end
end
