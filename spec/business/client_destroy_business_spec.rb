require 'active_support/core_ext/module/delegation'
require 'app/business/client_destroy_business'

describe ClientDestroyBusiness do
  let(:client) { instance_double('Client') }

  let(:options) do
    { client: client }
  end

  subject { ClientDestroyBusiness.new(options) }

  describe '#destroy!' do
    it 'destroys client' do
      expect(client).to receive(:destroy!)

      subject.destroy!
    end
  end
end
