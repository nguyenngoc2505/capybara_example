require 'rails_helper'

describe 'creating a user', type: :feature, js: true do
  it 'successfully creates user' do
    visit '/users'
    click_link 'New User'

    within '#new_user' do
      fill_in 'Name', with: "Ngoc Nguyen"
      fill_in 'Age', with: 27
    end
    click_button 'Create User'

    expect(page).to have_content 'User was successfully created.'
    expect(page).to have_content 'Ngoc Nguyen'
  end

  it 'failed creates user with error age' do
    visit '/users'
    click_link 'New User'

    within '#new_user' do
      fill_in 'Name', with: "Ngoc Nguyen"
      fill_in 'Age', with: ""
    end
    click_button 'Create User'

    expect(page).to have_content "Age can't be blank"
  end

  it 'failed creates user with error name' do
    visit '/users'
    click_link 'New User'

    within '#new_user' do
      fill_in 'Name', with: ""
      fill_in 'Age', with: 27
    end
    click_button 'Create User'

    expect(page).to have_content "Name can't be blank"
  end
end
