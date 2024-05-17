module CustomizableAttributes
  extend ActiveSupport::Concern

  included do
    after_initialize :extract_custom_attributes
  end

  def extract_custom_attributes
    model_name = self.class.name.titlecase
    config = CustomAttributesConfig.find_by(parent_model: model_name)

    if config
      attributes = JSON.parse(config.custom_attributes) # Storing list in JSON format on SQLite3
      attributes.each do |attribute|
        define_attribute(attribute, cast_type: 'string') # TODO check this logic
      end
    end
  end
end
