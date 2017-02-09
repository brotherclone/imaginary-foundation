class ProjectEssayAttr < ActiveRecord::Migration
  def change
    add_column :essays, :title, :string
    add_column :projects, :title, :string
    add_column :projects, :body, :text
    add_column :essays, :body, :text
    add_column :projects, :external_url, :string
  end
end