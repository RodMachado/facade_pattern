class ClientPresenter

  def initialize(options)
    @client = options.fetch(:client)
  end

  def dob_formatted
    dob.strftime('%d/%m/%Y')
  end

  delegate(
    :id,
    :name,
    :dob,
    :to_param,
    :to_model,
    to: :client
  )

  def showable?
    true
  end

  def editable?
    true
  end

  def destroyable?
    true
  end

  private

  attr_reader :client

end
