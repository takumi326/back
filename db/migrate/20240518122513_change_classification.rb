class ChangeClassification < ActiveRecord::Migration[7.0]
  def change
    add_column :classifications, :classification_type, :string
  end
end
