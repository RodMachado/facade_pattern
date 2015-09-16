class DefaultFacade

  def initialize(options)
    @params = options.fetch(:params)
    @current_user = options.fetch(:current_user)
  end

  private

  attr_reader(
    :params,
    :current_user
  )

end
