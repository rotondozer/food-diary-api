class DateMaster < ApplicationRecord
  belongs_to :user
  has_many :food_logs, dependent: :destroy
  has_many :allergic_reaction_logs, dependent: :destroy
end
