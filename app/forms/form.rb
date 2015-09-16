class Form

  include Virtus.model(nullify_blank: true)
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def persisted?
    false
  end

end
