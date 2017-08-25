class DateMaster < ApplicationRecord
  belongs_to :user
  has_many :food_logs
  has_many :allergic_reaction_logs
end
