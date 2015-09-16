class ClientDestroyBusiness

  def initialize(options)
    @client = options.fetch(:client)
  end

  def destroy!
    client.destroy!
  end

  private

  attr_reader :client
end