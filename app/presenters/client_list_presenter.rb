class ClientListPresenter

  def initialize(options)
    @query = options.fetch(:query)
  end

  def clients
    query.all.map { |client| ClientPresenter.new(client: client) }
  end

  private

  attr_reader :query

end
