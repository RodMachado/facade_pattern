require 'rails_helper'

feature 'Client Destroy' do
  let(:user) { FactoryGirl.create(:user_factory) }

  let!(:client) { FactoryGirl.create(:client_factory) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'destroying client' do
    visit clients_path
    expect(page).to have_content('Foo')
    page.find_by_id("destroy_client_#{client.id}").click
    expect(page).to have_content('Client was successfully destroyed.')
    expect(page).not_to have_content('Foo')
  end
end