require 'rails_helper'

describe ClientsController do
  let(:user) { FactoryGirl.create(:user_factory) }
  let(:client) { FactoryGirl.create(:client_factory) }

  before do
    sign_in user
  end

  describe 'GET index' do
    it 'assigns @facade' do
      get :index
      expect(assigns(:facade)).to be_an_instance_of(ClientIndexFacade)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns @facade' do
      get :show, id: client.id
      expect(assigns(:facade)).to be_an_instance_of(ClientShowFacade)
    end

    it 'renders the show template' do
      get :show, id: client.id
      expect(response).to render_template('show')
    end
  end

  describe 'GET new' do
    it 'assigns @facade' do
      get :new
      expect(assigns(:facade)).to be_an_instance_of(ClientCreateFacade)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      before do
        allow_any_instance_of(ClientCreateFacade)
          .to receive(:save!)
          .and_return(true)
      end

      it 'assigns @facade' do
        post :create, client: FactoryGirl.attributes_for(:client_factory)
        expect(assigns(:facade)).to be_an_instance_of(ClientCreateFacade)
      end

      it 'redirects to index' do
        post :create, client: FactoryGirl.attributes_for(:client_factory)
        expect(response).to redirect_to(clients_path)
      end
    end

    context 'with invalid attributes' do
      before do
        allow_any_instance_of(ClientCreateFacade)
          .to receive(:save!)
          .and_return(false)
      end

      it 'assigns @facade' do
        post :create, client: FactoryGirl.attributes_for(:client_factory)
        expect(assigns(:facade)).to be_an_instance_of(ClientCreateFacade)
      end

      it 'renders the new template' do
        post :create, client: FactoryGirl.attributes_for(:client_factory)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET edit' do
    it 'assigns @facade' do
      get :edit, id: client.id
      expect(assigns(:facade)).to be_an_instance_of(ClientUpdateFacade)
    end

    it 'renders the edit template' do
      get :edit, id: client.id
      expect(response).to render_template('edit')
    end
  end

  describe 'PUT update' do
    context 'with valid attributes' do
      before do
        allow_any_instance_of(ClientUpdateFacade)
          .to receive(:update!)
          .and_return(true)
      end

      it 'assigns @facade' do
        put(
          :update,
          id: client.id,
          client: FactoryGirl.attributes_for(:client_factory)
        )
        expect(assigns(:facade)).to be_an_instance_of(ClientUpdateFacade)
      end

      it 'redirects to index' do
        put(
          :update,
          id: client.id,
          client: FactoryGirl.attributes_for(:client_factory)
        )
        expect(response).to redirect_to(clients_path)
      end
    end

    context 'with invalid attributes' do
      before do
        allow_any_instance_of(ClientUpdateFacade)
          .to receive(:update!)
          .and_return(false)
      end

      it 'assigns @facade' do
        put(
          :update,
          id: client.id,
          client: FactoryGirl.attributes_for(:client_factory)
        )
        expect(assigns(:facade)).to be_an_instance_of(ClientUpdateFacade)
      end

      it 'renders the edit template' do
        put(
          :update,
          id: client.id,
          client: FactoryGirl.attributes_for(:client_factory)
        )
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when deletable' do
      before do
        allow_any_instance_of(ClientDestroyFacade)
          .to receive(:destroy!)
          .and_return(true)
      end

      it 'assigns @facade' do
        delete :destroy, id: client.id
        expect(assigns(:facade)).to be_an_instance_of(ClientDestroyFacade)
      end

      it 'redirects to index' do
        delete :destroy, id: client.id
        expect(response).to redirect_to(clients_path)
      end
    end

    context 'when not deletable' do
      before do
        allow_any_instance_of(ClientDestroyFacade)
          .to receive(:destroy!)
          .and_return(false)
      end

      it 'assigns @facade' do
        delete :destroy, id: client.id
        expect(assigns(:facade)).to be_an_instance_of(ClientDestroyFacade)
      end

      it 'renders the show template' do
        delete :destroy, id: client.id
        expect(response).to render_template('show')
      end
    end
  end
end
