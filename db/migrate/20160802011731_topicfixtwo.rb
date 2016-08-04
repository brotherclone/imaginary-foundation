class Topicfixtwo < ActiveRecord::Migration
  def change

    remove_reference :essays, :topic
    remove_reference :projects, :topic
    add_reference :tags, :essays
    add_reference :tags, :topics
  end
end
