class ClientListPresenter

  def initialize(options)
    @query = options.fetch(:query)
  end

  def clients
    all_clients.collect { |client| ClientPresenter.new(client: client) }
  end

  private

  attr_reader :query

  def all_clients
    query.all
  end

end
