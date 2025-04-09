class CreateTrainingPhases < ActiveRecord::Migration[7.1]
  def change
    create_table :training_phases do |t|
      t.string :goal
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
