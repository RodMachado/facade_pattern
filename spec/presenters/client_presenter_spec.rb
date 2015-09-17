require 'app/presenters/client_presenter'

describe ClientPresenter do
  let(:client) do
    double('Client')
  end

  subject { ClientPresenter.new(client: client) }

  describe '#id' do
    it 'is delegated to client' do
      expect(client).to receive(:id)
      subject.id
    end
  end

  describe '#name' do
    it 'is delegated to client' do
      expect(client).to receive(:name)
      subject.name
    end
  end

  describe '#city' do
    it 'is delegated to client' do
      expect(client).to receive(:city)
      subject.city
    end
  end

  describe '#to_param' do
    it 'is delegated to client' do
      expect(client).to receive(:to_param)
      subject.to_param
    end
  end

  describe '#to_model' do
    it 'is delegated to client' do
      expect(client).to receive(:to_model)
      subject.to_model
    end
  end
end