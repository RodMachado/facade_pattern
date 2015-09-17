require 'active_support/core_ext/module/delegation'
require 'app/presenters/client_presenter'
require 'app/presenters/client_list_presenter'

describe ClientListPresenter do
  let(:client_a) { double(:client_a) }
  let(:client_b) { double(:client_b) }
  let(:query) do
    double(
      :query,
      all: [client_a, client_b]
    )
  end

  let(:options) do
    {
      query: query
    }
  end

  subject { ClientListPresenter.new(options) }

  describe '#clients' do
    it 'returns list of client presenters' do
      class_double('ClientPresenter')

      expect(ClientPresenter).to receive(:new).with(client: client_a)
      expect(ClientPresenter).to receive(:new).with(client: client_b)

      subject.clients
    end
  end
end
