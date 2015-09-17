require 'active_support/core_ext/module/delegation'
require 'app/business/client_save_business'

describe ClientSaveBusiness do
  let(:client) { double('Client') }

  let(:form) do
    double(
      'ClientForm',
      name: 'Foo',
      city: 'Bar'
    )
  end

  let(:options) do
    {
      client: client,
      form: form
    }
  end

  subject { ClientSaveBusiness.new(options) }

  describe '#save' do
    it 'assigns and saves client' do
      expect(client).to receive(:name=).with('Foo')
      expect(client).to receive(:city=).with('Bar')
      expect(client).to receive(:save!)
      subject.save!
    end
  end
end
