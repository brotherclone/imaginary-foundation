class ForgotDescriptions < ActiveRecord::Migration
  def change
    add_column :essays, :description, :text
    add_column :projects, :description, :text
  end
end
