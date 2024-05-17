require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'with custom fields' do
    before do
      custom_attr_config = CustomAttributesConfig.new(parent_model: 'Customer', custom_attributes: ['email'])
      custom_attr_config.save
    end

    it 'is valid' do
      customer = Customer.new(name: 'Test')
      expect(customer).to be_valid
      expect(customer.attributes).to include('email')
    end
  end
end
