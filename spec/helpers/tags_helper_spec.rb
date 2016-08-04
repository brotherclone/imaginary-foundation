require 'rails_helper'

RSpec.describe TagsHelper, type: :helper do
  describe 'Tags to Topics'do
    it 'links to the tag\'s topic' do
      test_tag = build :tag
      topic_path = '/topics.'+test_tag.topic_id.to_s
      expect(helper.tags_to_topic(test_tag)).to eq(topic_path)
    end
  end
end
