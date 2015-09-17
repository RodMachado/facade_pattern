require 'form_helper'
require 'app/validations/client_common_validations'
require 'app/forms/client_form'

describe ClientForm do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
  end
end
