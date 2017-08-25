# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :date_masters
  has_many :food_logs, through: :date_masters
  has_many :allergic_reaction_logs, through: :date_masters
end
