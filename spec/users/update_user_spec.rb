require 'rails_helper'

describe 'updating a user', type: :feature, js: true do
  before :each do
    @user = create :user
  end

  it 'successfully creates user' do
    visit '/users'
    click_link 'Edit'

    within '#edit_user' do
      fill_in 'Name', with: "Nguyen Thi Ngoc"
      fill_in 'Age', with: 20
    end
    click_button 'Update User'

    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Nguyen Thi Ngoc'
  end

  it 'failed creates user with error age' do
    visit '/users'
    click_link 'Edit'

    within '#edit_user' do
      fill_in 'Name', with: "Nguyen Thi Ngoc"
      fill_in 'Age', with: ''
    end
    click_button 'Update User'

    expect(page).to have_content "Age can't be blank"
  end

  it 'failed creates user with error name' do
    visit '/users'
    click_link 'Edit'

    within '#edit_user' do
      fill_in 'Name', with: ""
      fill_in 'Age', with: 20
    end
    click_button 'Update User'

    expect(page).to have_content "Name can't be blank"
    page.save_screenshot('screenshot.png')
  end
end