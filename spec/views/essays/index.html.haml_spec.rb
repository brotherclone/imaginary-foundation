require 'rails_helper'

RSpec.describe 'essays/index', type: :view do
  before(:each) do
    assign(:essays, [
      Essay.create!(),
      Essay.create!()
    ])
  end

  it 'renders a list of essays' do
    render
  end
end
