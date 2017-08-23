class FoodLogSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :description, :calories
end
