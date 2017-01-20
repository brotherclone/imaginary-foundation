class CreateGoodwords < ActiveRecord::Migration
  def change
    create_table :goodwords do |t|

      t.timestamps
    end
  end
end
