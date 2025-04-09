class CreatePromptLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :prompt_logs do |t|
      t.string :kind
      t.text :prompt_text
      t.text :response_text
      t.string :model_used
      t.references :user, null: false, foreign_key: true
      t.references :training_phase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
