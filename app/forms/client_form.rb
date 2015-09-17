class ClientForm < Form

  include ClientCommonValidations

  attribute :name, String
  attribute :city, String

end
