class ClientDestroyBusiness

  def initialize(options)
    @client = options.fetch(:client)
  end

  delegate(
    :destroy!,
    to: :client
  )

  private

  attr_reader :client

end
