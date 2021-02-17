class Task < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id,  presence: true
  validates :title,    presence: true
  validates :description, length: { maximum: 100 }
  validates :state,    presence: true
  validates :due_date, presence: true
end
