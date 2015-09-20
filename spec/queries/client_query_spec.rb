require 'rails_helper'

describe ClientQuery do
  let(:form) do
    double(
      :form,
      name: nil,
      city: nil
    )
  end

  let(:client_a) do
    FactoryGirl.create(
      :client_factory,
      name: 'Spanish Football Association',
      city: 'Barcelona'
    )
  end

  let(:client_b) do
    FactoryGirl.create(
      :client_factory,
      name: 'American Football Association',
      city: 'New York'
    )
  end

  let(:client_c) do
    FactoryGirl.create(
      :client_factory,
      name: 'Hockey Association',
      city: 'New York'
    )
  end

  subject do
    ClientQuery.new(form: form, params: {})
  end

  describe '#all' do
    context 'with no filters' do
      it 'returns all records ordered by ascending name' do
        expect(subject.all)
          .to eq(
            [client_b, client_c, client_a]
          )
      end
    end

    context 'with name filter' do
      it 'returns records including filter params' do
        allow(form).to receive(:name).and_return('Foo')
        expect(subject.all)
          .to eq([client_b, client_a])
      end
    end

    context 'with city filter' do
      it 'returns records including filter params' do
        allow(form).to receive(:city).and_return('York')
        expect(subject.all)
          .to eq([client_b, client_c])
      end
    end

    context 'with name and city filter' do
      it 'returns records including filter params' do
        allow(form).to receive(:name).and_return('Foo')
        allow(form).to receive(:city).and_return('Bar')
        expect(subject.all)
          .to eq([client_a])
      end
    end
  end
end