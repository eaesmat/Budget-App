require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  it 'can enter a name and receive a email' do
    visit new_user_session_path
    expect(page).to have_content 'Log in'
  end

  it 'user can see inputs and button' do
    visit new_user_session_path
    expect(page).to have_current_path(new_user_session_path)
  end
end
