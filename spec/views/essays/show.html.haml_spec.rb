require 'rails_helper'

RSpec.describe 'essays/show', type: :view do
  before(:each) do
    @essay = assign(:essay, Essay.create!())
  end

  it 'renders attributes in <p>' do
    render
  end
end
