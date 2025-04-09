class PromptLog < ApplicationRecord
  belongs_to :user
  belongs_to :training_phase
end
