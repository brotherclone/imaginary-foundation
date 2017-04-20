require 'rails_helper'

describe 'external redirection' do
  it 'redirects to google.com' do
    get '/style-guide'
    expect(response).to redirect_to('/assets/styleguide.html')
  end
end