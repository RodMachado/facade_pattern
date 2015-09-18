class ClientsController < ApplicationController

  def index
    @facade = ClientIndexFacade.new(default_params)
    render :index, locals: {
      presenter: @facade.presenter,
      form: @facade.form
    }
  end

  def show
    @facade = ClientShowFacade.new(default_params)
    render :show, locals: {
      presenter: @facade.presenter
    }
  end

  def new
    @facade = ClientCreateFacade.new(default_params)
    render :new, locals: {
      form: @facade.form,
      url: clients_path
    }
  end

  def create
    @facade = ClientCreateFacade.new(default_params)

    if @facade.save!
      redirect_to clients_path, notice: t('defaults.notices.created', resource: 'Client')
    else
      render :new, locals: {
        form: @facade.form,
        url: clients_path
      }
    end
  end

  def edit
    @facade = ClientUpdateFacade.new(default_params)
    render :edit, locals: {
      form: @facade.form,
      url: client_path(@facade.client)
    }
  end

  def update
    @facade = ClientUpdateFacade.new(default_params)
    if @facade.update!
      redirect_to clients_path, notice: t('defaults.notices.updated', resource: 'Client')
    else
      render :edit, locals: {
        form: @facade.form,
        url: client_path(@facade.client)
      }
    end
  end

  def destroy
    @facade = ClientDestroyFacade.new(default_params)
    if @facade.destroy!
      redirect_to clients_url, notice: t('defaults.notices.destroyed', resource: 'Client')
    else
      render :show, locals: {
        presenter: @facade.presenter
      }
    end
  end

end
