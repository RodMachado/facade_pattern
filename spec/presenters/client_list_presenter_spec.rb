require 'active_support/core_ext/module/delegation'
require 'app/presenters/client_presenter'
require 'app/presenters/client_list_presenter'

describe ClientListPresenter do
  let(:client_a) { double(:client_a) }
  let(:client_b) { double(:client_b) }
  let(:clients) { [client_a, client_b] }

  let(:options) do
    {
      clients: clients
    }
  end

  subject { ClientListPresenter.new(options) }

  describe '#list' do
    it 'returns list of client presenters' do
      class_double('ClientPresenter')

      expect(ClientPresenter).to receive(:new).with(client: client_a)
      expect(ClientPresenter).to receive(:new).with(client: client_b)

      subject.list
    end
  end
end
