class GoodWordsProps < ActiveRecord::Migration
  def change
    add_column :goodwords, :word, :string
    add_column :goodwords, :good, :boolean
    add_column :goodwords, :fromURL, :string
  end
end
