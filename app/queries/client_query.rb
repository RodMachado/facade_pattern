class ClientQuery

  def initialize(options)
    @form = options.fetch(:form)
    @params = options.fetch(:params)
  end

  def all
    @all ||= query
  end

  private

  attr_reader :form, :params

  delegate(
    :name,
    :city,
    to: :form
  )

  def query
    query = Client.order('name ASC')
    query = query.page(params[:page])
    query = query.where('name LIKE ?', "%#{name}%") unless name.blank?
    query = query.where('city LIKE ?', "%#{city}%") unless city.blank?
    query
  end

end
