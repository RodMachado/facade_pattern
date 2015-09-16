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
    :dob,
    to: :form
  )

  def query
    query = User
    query = query.where(name: name) unless name.blank?
    query = query.where(dob: dob) unless dob.blank?
    query
  end
end