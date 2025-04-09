class CreateWorkoutPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :workout_plans do |t|
      t.integer :week_number
      t.integer :day_number
      t.jsonb :content
      t.references :training_phase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
