class AddDefaultToRepetitionSettingsInTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :repetition_settings, :jsonb, default: [], using: "(repetition_settings::text)::jsonb"
  end
end
