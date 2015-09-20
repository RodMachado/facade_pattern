class ClientIndexFacade < DefaultFacade

  def presenter
    @presenter ||= ClientListPresenter.new(
      clients: clients
    )
  end

  def form
    @form ||= ClientSearchForm.new(
      params[:client_search_form]
    )
  end

  def clients
    @clients ||= ClientQuery.new(
      form: form,
      params: params
    ).all
  end

end
