class FoodLogSerializer < ActiveModel::Serializer
  attributes :id, :date_time, :description, :calories
end
