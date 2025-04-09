class CreateMeasurements < ActiveRecord::Migration[7.1]
  def change
    create_table :measurements do |t|
      t.jsonb :data
      t.date :date_logged
      t.references :training_phase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
