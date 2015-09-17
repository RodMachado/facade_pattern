require 'facade_helper'
require 'app/facades/client_update_facade'

describe ClientUpdateFacade do
  let(:client_form_params) do
    {
      name: 'Foo',
      city: 'Bar'
    }
  end

  let(:params) do
    {
      id: 1,
      client_form: client_form_params
    }
  end

  let(:client_instance) { double(:client_instance) }

  let(:client_form_instance) do
    double(
      :client_form_instance,
      valid?: true
    )
  end

  let(:client_save_business_instance) do
    double(
      :client_save_business_instance,
      save!: double
    )
  end

  subject do
    ClientUpdateFacade.new(
      current_user: double(:user),
      params: params
    )
  end

  before do
    mock_client
    mock_client_form
    mock_client_save_business
  end

  describe '#form' do
    it 'instantiates form object' do
      expect(ClientForm)
        .to receive(:new)
        .with(client_form_params)
      subject.form
    end
  end

  describe '#valid?' do
    it 'is delegated to form' do
      expect(client_form_instance)
        .to receive(:valid?)
      subject.valid?
    end
  end

  describe '#save!' do
    it 'instantiates save business' do
      expect(ClientSaveBusiness)
        .to receive(:new)
        .with(
          form: client_form_instance,
          client: client_instance
        ).and_return(client_save_business_instance)
      expect(client_save_business_instance).to receive(:save!)

      subject.update!
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

  def mock_client_form
    stub_const(
      'ClientForm',
      double('ClientForm', new: client_form_instance)
    )
  end

  def mock_client_save_business
    stub_const(
      'ClientSaveBusiness',
      double('ClientSaveBusiness', new: client_save_business_instance)
    )
  end
end
