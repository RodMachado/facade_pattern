module ClientCommonValidations

  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :city, presence: true
  end

end