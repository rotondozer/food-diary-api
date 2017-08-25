class FoodLogSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :description, :calories, :date_reference_id
end
