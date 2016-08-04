class Belongstotoo < ActiveRecord::Migration
  def change
    add_reference :tags, :project, index:true
    add_reference :tags, :essay, index:true
  end
end
