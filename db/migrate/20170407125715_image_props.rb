class ImageProps < ActiveRecord::Migration
  def change
    add_column :images, :title, :string
    add_column :images, :caption, :text
    add_column :images, :credit, :string
    add_column :images, :credit_link, :string
  end
end
