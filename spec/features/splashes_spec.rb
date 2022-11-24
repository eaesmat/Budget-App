require 'rails_helper'

RSpec.feature 'Splashes Screen', type: :feature do
  background do
    visit root_path
  end

  scenario 'show Splash' do
    expect(page).to have_content('My Budget App')
  end

  scenario 'show Splash' do
    expect(page).to have_content('Sign in')
  end

  scenario 'show Splash' do
    expect(page).to have_content('Sign up')
  end
end
