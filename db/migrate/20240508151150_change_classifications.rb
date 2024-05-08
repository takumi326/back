class ChangeClassifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :classifications, :user, foreign_key: true
  end
end
