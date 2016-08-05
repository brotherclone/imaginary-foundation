require 'rails_helper'

describe 'Navigation functionality', :type => :feature do

  it 'checks main navigation', :js => true  do
    visit root_path
    expect(page).to have_css('nav .navigation-container')
    expect(page).to have_content('Imaginary Foundation')
    expect(page).to have_content('About')
    expect(page).to have_content('Essays')
    expect(page).to have_content('Projects')
  end

  it 'checks the footer navigation', :js => true do
  
  end

end
