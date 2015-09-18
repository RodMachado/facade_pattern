require 'facade_helper'
require 'app/facades/client_destroy_facade'

describe ClientDestroyFacade do
  let(:client_instance) { double(:client_instance) }
  let(:client_destroy_business_instance) do
    double(:client_destroy_business_instance)
  end

  let(:params) do
    {
      id: double(:id)
    }
  end

  subject do
    ClientDestroyFacade.new(
      current_user: double(:user),
      params: params
    )
  end

  before do
    mock_client
    mock_client_presenter
    mock_client_destroy_business
  end

  describe '#presenter' do
    it 'instantiates a presenter' do
      expect(ClientPresenter)
        .to receive(:new)
        .with(client: client_instance)

      subject.presenter
    end
  end

  describe '#destroy!' do
    it 'destroys client' do
      expect(ClientDestroyBusiness)
        .to receive(:new)
        .with(client: client_instance)
      expect(client_destroy_business_instance).to receive(:destroy!)

      subject.destroy!
    end
  end

  def mock_client
    stub_const(
      'Client',
      double(
        'Client',
        find: client_instance
      )
    )
  end

  def mock_client_presenter
    stub_const(
      'ClientPresenter',
      double('ClientPresenter', new: double)
    )
  end

  def mock_client_destroy_business
    stub_const(
      'ClientDestroyBusiness',
      double(
        'ClientDestroyBusiness',
        new: client_destroy_business_instance
      )
    )
  end
end
