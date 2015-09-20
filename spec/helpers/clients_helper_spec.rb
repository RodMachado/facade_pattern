require 'rails_helper'

describe ClientsHelper do
  let(:client) do
    FactoryGirl.create(:client_factory)
  end

  let(:client_presenter) do
    double(
      :client_presenter,
      id: 1,
      to_model: client
    )
  end

  describe '#link_to_new' do
    it 'returns link to new' do
      expect(helper.link_to_new)
        .to eq(
          '<a class="btn btn-primary" href="/clients/new">New Client</a>'
        )
    end
  end

  describe '#link_to_show' do
    it 'returns link to show client' do
      expect(helper.link_to_show(client_presenter))
        .to eq(
          '<a href="/clients/1"><i class="fa fa-search"></i></a>'
        )
    end
  end

  describe '#link_to_edit' do
    it 'returns link to edit client' do
      expect(helper.link_to_edit(client_presenter))
        .to eq(
          '<a href="/clients/1/edit"><i class="fa fa-pencil-square-o"></i></a>'
        )
    end
  end

  describe '#link_to_destroy' do
    it 'returns link to destroy client' do
      expect(helper.link_to_destroy(client_presenter))
        .to eq(
          '<a id="destroy_client_1" data-confirm="Are you sure?" rel="nofollow" ' \
          'data-method="delete" href="/clients/1"><i class="fa fa-trash"></i></a>'
        )
    end
  end

end