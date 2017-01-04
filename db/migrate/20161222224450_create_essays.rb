class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|

      t.timestamps
    end
  end
end
