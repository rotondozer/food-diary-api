class FoodLogSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :description, :calories
  has_one :date_master
end
