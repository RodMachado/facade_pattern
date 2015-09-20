class ClientListPresenter

  def initialize(options)
    @clients = options.fetch(:clients)
  end

  def list
    clients.collect { |client| ClientPresenter.new(client: client) }
  end

  private

  attr_reader :clients

end
