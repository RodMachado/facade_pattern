module ClientCommonValidations

  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :dob, presence: true
  end

end