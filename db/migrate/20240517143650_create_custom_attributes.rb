class CreateCustomAttributes < ActiveRecord::Migration[7.1]
  def change
    create_table :custom_attributes do |t|
      t.string :attribute_name
      t.string :attribute_value
      t.references :customizable, polymorphic: true
      t.timestamps
    end
  end
end
