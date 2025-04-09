class CreateWorkoutCompletions < ActiveRecord::Migration[7.1]
  def change
    create_table :workout_completions do |t|
      t.datetime :completed_at
      t.jsonb :plan_content
      t.references :workout_plan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
