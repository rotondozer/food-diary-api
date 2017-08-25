class DateMaster < ApplicationRecord
  has_many :food_logs
  has_many :allergic_reaction_logs
end
