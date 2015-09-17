class ClientQuery

  def initialize(options)
    @form = options.fetch(:form)
  end

  def all
    @all ||= query
  end

  private

  attr_reader :form

  delegate(
    :name,
    :city,
    to: :form
  )

  def query
    query = Client.order('name ASC')
    query = query.where('name LIKE ?', "%#{name}%") unless name.blank?
    query = query.where('city LIKE ?', "%#{city}%") unless city.blank?
    query
  end

end
