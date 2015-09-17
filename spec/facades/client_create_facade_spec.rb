require 'facade_helper'
require 'app/facades/client_create_facade'

describe ClientCreateFacade do
  let(:client_form) do
    {
      name: 'Foo',
      city: 'Bar'
    }
  end

  let(:params) do
    {
      client_form: client_form
    }
  end

  let(:save_business_instance) { double(:save_business_instance) }

  let(:client_form_instance) do
    double(
      :client_form_instance,
      valid?: double
    )
  end

  subject do
    ClientCreateFacade.new(
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
        .with(client_form)

      subject.form
    end
  end

  describe '#valid?' do
    it 'is delegated to form' do
      expect(subject.form)
        .to receive(:valid?)

      subject.valid?
    end
  end

  describe '#save!' do
    let(:client) { stub_const('Client', Class.new) }

    it 'instantiates save business' do
      expect(ClientSaveBusiness)
        .to receive(:new)
        .with(
          form: subject.form,
          client: client
        ).and_return(save_business_instance)
      expect(save_business_instance).to receive(:save!)

      subject.save!
    end
  end

  def mock_client
    stub_const(
      'Client',
      double('Client')
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
      double('ClientSaveBusiness')
    )
  end
end
