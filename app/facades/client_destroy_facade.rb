class ClientDestroyFacade < DefaultFacade

  def presenter
    ClientPresenter.new(client: client)
  end

  def destroy!
    ClientDestroyBusiness.new(client: client).destroy!
  end

  private

  def client
    @client ||= Client.find(params[:id])
  end

end