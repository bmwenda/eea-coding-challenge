class CustomAttributesConfig < ApplicationRecord
  validates :parent_model, :custom_attributes, presence: true
  validates :parent_model, uniqueness: true
end
