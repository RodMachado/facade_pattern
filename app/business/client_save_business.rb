class ClientSaveBusiness

  def initialize(options)
    @client = options.fetch(:client)
    @form = options.fetch(:form)
  end

  def save!
    client.name = name
    client.city = city
    client.save!
  end

  private

  attr_reader :client, :form

  delegate(
    :name,
    :city,
    to: :form
  )

end