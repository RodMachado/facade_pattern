require 'rails_helper'

feature 'Update Client' do
  let(:user) { FactoryGirl.create(:user_factory) }

  let(:client) { FactoryGirl.create(:client_factory) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'with valid attributes' do
    visit edit_client_path(client)
    fill_in('Name', with: 'XXX')
    fill_in('City', with: 'YYY')
    click_button('Send')
    expect(page).to have_content('Client was successfully updated.')
    expect(page).to have_content('XXX')
    expect(page).to have_content('YYY')
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
