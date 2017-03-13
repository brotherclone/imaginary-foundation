class CreatePullQuotes < ActiveRecord::Migration
  def change
    create_table :pull_quotes do |t|
      t.text :quote
      t.references :essay, index: true, foreign_key: true
      t.timestamps
    end
  end
end
