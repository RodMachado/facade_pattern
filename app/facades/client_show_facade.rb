class ClientShowFacade < DefaultFacade

  def presenter
    ClientPresenter.new(client: client)
  end

  private

  def client
    @client ||= Client.find(params[:id])
  end

end
