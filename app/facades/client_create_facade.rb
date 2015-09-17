class ClientCreateFacade < DefaultFacade

  def form
    @form ||= ClientForm.new(client_form_params)
  end

  def save!
    return false unless valid?
    ClientSaveBusiness.new(
      client: client,
      form: form
    ).save!
  end

  def client
    Client.new
  end

  private

  delegate(
    :valid?,
    to: :form
  )

  def client_form_params
    params[:client_form] || {}
  end

end
