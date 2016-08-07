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
    today =Date.today
    this_year = today.strftime('%Y').to_s
    visit root_path
    expect(page).to have_css('.footer-navigation')
    expect(page).to have_content('Privacy, Terms, Etc.')
    expect(page).to have_content('Related Sites')
    expect(page).to have_content('Contact Info')
    expect(page).to have_content(this_year+' &copy;')
  end

end
