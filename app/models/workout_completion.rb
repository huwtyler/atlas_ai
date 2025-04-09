class WorkoutCompletion < ApplicationRecord
  belongs_to :workout_plan
  belongs_to :user
end
