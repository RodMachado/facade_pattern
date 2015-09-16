class ClientUpdateFacade < DefaultFacade

  def form
    @form ||= ClientForm.new(client_form_params)
  end

  def update!
    return false unless form.valid?
    ClientSaveBusiness.new(
      client: client,
      form: form
    ).save!
  end

  def client
    @client ||= Client.find(params[:id])
  end

  private

  def client_form_params
    params[:client_form] || client.attributes
  end

end