require 'facade_helper'
require 'app/facades/client_index_facade'

describe ClientIndexFacade do
  let(:query_instance) { double(:query_instance) }
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
        .with(query: query_instance)

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

  describe '#query' do
    it 'instantiates query object' do
      expect(ClientQuery)
        .to receive(:new)
        .with(
          form: subject.form
        )

      subject.query
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
