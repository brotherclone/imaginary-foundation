class DescriptionStringNotText < ActiveRecord::Migration
  def change
    change_column :projects, :description, :string
    change_column :essays, :description, :string
  end
end
