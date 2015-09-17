require 'facade_helper'
require 'app/facades/client_index_facade'

describe ClientIndexFacade do
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
    mock_client_search_form
    mock_client_query
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
      double('ClientSearchForm', new: double)
    )
  end

  def mock_client_query
    stub_const('ClientQuery', double('ClientQuery'))
  end
end
