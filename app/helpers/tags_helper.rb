module TagsHelper
  def tags_to_topic tag
    topic_tag_path = topics_path(tag.topic_id)
   return topic_tag_path
  end
end
