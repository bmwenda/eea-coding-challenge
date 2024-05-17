module CustomizableAttributes
  extend ActiveSupport::Concern

  included do
    custom_attributes_list.each do |attribute|
      attribute attribute.to_sym, :string
    end

    before_create :persist_custom_attributes
    has_many :custom_attributes, as: :customizable, dependent: :destroy
  end

  class_methods do
    def custom_attributes_list
      model_name = name.titlecase
      attributes_config = CustomAttributesConfig.find_by(parent_model: model_name)
      if attributes_config
        JSON.parse(attributes_config.custom_attributes) # Storing array in JSON format on SQLite3
      else
        []
      end
    end
  end

  def persist_custom_attributes
    # Assumes all custom attributes must always be present
    self.class.custom_attributes_list.each do |name|
      attribute_name = name
      attribute_value = send(attribute_name.to_sym)
      custom_attributes.build(attribute_name: attribute_name, attribute_value: attribute_value)
    end
  end
end
