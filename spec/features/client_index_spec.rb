require 'rails_helper'

feature 'Client Index' do
  let(:user) { FactoryGirl.create(:user_factory) }

  let!(:client_a) { FactoryGirl.create(:client_factory, name: 'Client A') }
  let!(:client_b) { FactoryGirl.create(:client_factory, name: 'Client B') }
  let!(:client_c) { FactoryGirl.create(:client_factory, name: 'Client C') }
  let!(:client_d) { FactoryGirl.create(:client_factory, name: 'Client D') }
  let!(:client_e) { FactoryGirl.create(:client_factory, name: 'Client E') }
  let!(:client_f) { FactoryGirl.create(:client_factory, name: 'Client F') }

  before do
    login_as(user, scope: :user)
  end

  scenario 'list clients' do
    visit clients_path
    expect(page).to have_content('Client A')
    expect(page).to have_content('Client B')
    expect(page).to have_content('Client C')
    expect(page).to have_content('Client D')
    expect(page).to have_content('Client E')
    expect(page).not_to have_content('Client F')
  end

  scenario 'paginate' do
    visit clients_path
    click_on 'Next'
    expect(page).not_to have_content('Client A')
    expect(page).not_to have_content('Client B')
    expect(page).not_to have_content('Client C')
    expect(page).not_to have_content('Client D')
    expect(page).not_to have_content('Client E')
    expect(page).to have_content('Client F')
  end
end