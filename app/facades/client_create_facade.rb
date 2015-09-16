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

  private

  delegate(
    :valid?,
    :errors,
    to: :form
  )

  def client
    Client.new
  end

  def client_form_params
    params[:client_form] || {}
  end

end
