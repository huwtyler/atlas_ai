class CreateMealPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :meal_plans do |t|
      t.integer :week_number
      t.integer :day_of_week
      t.jsonb :meals
      t.references :training_phase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
