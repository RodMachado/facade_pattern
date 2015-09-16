class ClientSaveBusiness

  def initialize(options)
    @client = options.fetch(:client)
    @form = options.fetch(:form)
  end

  def save!
    client.name = name
    client.dob = dob
    client.save!
  end

  private

  attr_reader :client, :form

  delegate(
    :name,
    :dob,
    to: :form
  )

end