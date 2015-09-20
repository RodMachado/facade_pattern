require 'facade_helper'
require 'app/facades/client_index_facade'

describe ClientIndexFacade do
  let(:clients) { double :clients }
  let(:query_instance) do
    double(:query_instance, all: clients)
  end
  let(:client_search_form) do
    {
      name: 'Foo',
      city: 'Bar'
    }
  end

  let(:params) do
    {
      id: double(:id),
      client_search_form: client_search_form
    }
  end

  subject do
    ClientIndexFacade.new(
      current_user: double(:user),
      params: params
    )
  end

  before do
    mock_client_list_presenter
    mock_client_search_form
    mock_client_query
  end

  describe '#presenter' do
    it 'instantiates presenter object' do
      expect(ClientListPresenter)
        .to receive(:new)
        .with(clients: clients)

      subject.presenter
    end
  end

  describe '#form' do
    it 'instantiates search form object' do
      expect(ClientSearchForm)
        .to receive(:new)
        .with(client_search_form)

      subject.form
    end
  end

  describe '#clients' do
    it 'instantiates query object' do
      expect(ClientQuery)
        .to receive(:new)
        .with(
          form: subject.form,
          params: params
        )
      expect(query_instance).to receive(:all)
      subject.clients
    end
  end

  def mock_client_search_form
    stub_const(
      'ClientSearchForm',
      double(
        'ClientSearchForm',
        new: query_instance
      )
    )
  end

  def mock_client_query
    stub_const('ClientQuery',
      double(
        'ClientQuery',
        new: query_instance
      )
    )
  end

  def mock_client_list_presenter
    stub_const(
      'ClientListPresenter',
      double('ClientListPresenter', new: double)
    )
  end
end
