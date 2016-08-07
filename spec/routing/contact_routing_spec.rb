require 'rails_helper'

RSpec.describe ContactController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/contact').to route_to('contact#index')
    end
  end
end