require 'rails_helper'

RSpec.describe RelatedSitesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/related-sites').to route_to('related_sites#index')
    end
  end
end