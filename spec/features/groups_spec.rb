require 'rails_helper'

RSpec.feature 'Groups', type: :feature do # rubocop:disable Metrics/BlockLength
  background do
    visit root_path
    click_link 'Sign up'
    fill_in 'Name', with: 'john'
    fill_in 'Email',	with: 'john123@gmail.com'
    fill_in 'Password 6 characters minimum',	with: 'password'
    fill_in 'password_confirmation',	with: 'password'
    click_button 'Sign up'
  end

  scenario 'Welcome! You have signed up successfully.' do
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'show empty category alert message' do
    expect(page).to have_content('No group added yet!')
  end

  scenario 'add new category' do
    click_link 'Add New group'
    fill_in 'Name', with: 'Test'
    attach_file('Icon', 'app/assets/images/budget_splash_bg.jpg')
    find('input[name="commit"]').click
    expect(page).to have_content('Test')
  end

  scenario 'add new category transaction' do
    click_link 'Add New group'
    fill_in 'Name', with: 'Test'
    attach_file('Icon', 'app/assets/images/budget_splash_bg.jpg')
    find('input[name="commit"]').click
  end

  scenario 'go to created category' do
    click_link 'Add New group'
    fill_in 'Name', with: 'Test'
    attach_file('Icon', 'app/assets/images/budget_splash_bg.jpg')
    find('input[name="commit"]').click
    expect(page).to have_content('Show this group')
  end
end
