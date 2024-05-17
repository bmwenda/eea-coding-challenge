module CustomizableAttributes
  extend ActiveSupport::Concern

  included do
    model_name = name.titlecase
    attributes_config = CustomAttributesConfig.find_by(parent_model: model_name)

    if attributes_config
      attributes = JSON.parse(attributes_config.custom_attributes) # Storing array in JSON format on SQLite3
      attributes.each do |attribute|
        attribute attribute.to_sym, :string
      end
    end

    before_create :persist_custom_attributes
    has_many :custom_attributes, as: :customizable, dependent: :destroy
  end

  def persist_custom_attributes
    model_name = self.class.name.titlecase
    attributes_config = CustomAttributesConfig.find_by(parent_model: model_name)
    attributes_list = JSON.parse(attributes_config.custom_attributes)
    attributes_list.each do |name|
      attribute_name = name
      attribute_value = send(attribute_name.to_sym)
      custom_attributes << CustomAttribute.new(attribute_name:, attribute_value:)
    end
  end
end
