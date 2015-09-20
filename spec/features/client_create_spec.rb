require 'rails_helper'

feature 'Client Create' do
  let(:user) { FactoryGirl.create(:user_factory) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'with valid attributes' do
    visit new_client_path
    fill_in('Name', with: 'Foo')
    fill_in('City', with: 'Bar')
    click_button('Send')
    expect(page).to have_content('Client was successfully created.')
    expect(page).to have_content('Foo')
    expect(page).to have_content('Bar')
  end

  scenario 'with invalid attributes' do
    visit new_client_path
    fill_in('Name', with: '')
    fill_in('City', with: '')
    click_button('Send')
    expect(page).to have_content('2 errors prohibited this client from being saved:')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("City can't be blank")
  end
end