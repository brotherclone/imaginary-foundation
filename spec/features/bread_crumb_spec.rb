require 'rails_helper'

describe 'Breadcrumb functionality', :type => :feature do

  it 'checks for a breadcrumb on the projects page', :js => true  do
    visit('/projects')
    expect(page).to have_content('Home')
    expect(page).to have_content('Projects')
  end
  it 'checks for a breadcrumb on the essay page', :js => true  do
    visit('/essays')
    expect(page).to have_content('Home')
    expect(page).to have_content('Essays')
  end

end
