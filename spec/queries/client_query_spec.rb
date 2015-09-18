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
      name: 'Football Association',
      city: 'Barcelona'
    )
  end

  let(:client_b) do
    FactoryGirl.create(
      :client_factory,
      name: 'Hockey Association',
      city: 'Montreal'
    )
  end

  let(:client_c) do
    FactoryGirl.create(
      :client_factory,
      name: 'American Hockey Association',
      city: 'New York'
    )
  end

  subject do
    ClientQuery.new(form: form)
  end

  describe '#all' do
    it 'orders by name ascending' do
      expect(subject.all)
        .to eq(
          [client_c, client_a, client_b]
        )
    end

    context 'name filter' do
      it 'returns records including filter params' do
        allow(form).to receive(:name).and_return('Foo')
        expect(subject.all)
          .to eq([client_a])
      end
    end

    context 'city filter' do
      it 'returns records including filter params' do
        allow(form).to receive(:city).and_return('Bar')
        expect(subject.all)
          .to eq([client_a])
      end
    end
  end
end