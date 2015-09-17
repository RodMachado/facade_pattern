class ClientIndexFacade < DefaultFacade

  def presenter
    @presenter ||= ClientListPresenter.new(
      query: query
    )
  end

  def form
    @form ||= ClientSearchForm.new(
      params[:client_search_form]
    )
  end

  def query
    @query ||= ClientQuery.new(
      form: form
    )
  end

end
