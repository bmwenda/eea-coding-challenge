class CreateCustomAttributesConfigs < ActiveRecord::Migration[7.1]
  def change
    create_table :custom_attributes_configs do |t|
      t.string :parent_model
      t.string :custom_attributes

      t.timestamps
    end
  end
end
