class FoodLogSerializer < ActiveModel::Serializer
  attributes :id, :time, :description, :calories
  has_one :date_master
end
