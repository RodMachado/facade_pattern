class ClientPresenter

  def initialize(options)
    @client = options.fetch(:client)
  end

  delegate(
    :id,
    :name,
    :city,
    :to_param,
    :to_model,
    to: :client
  )

  private

  attr_reader :client

end
