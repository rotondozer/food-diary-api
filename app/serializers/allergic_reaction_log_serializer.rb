class AllergicReactionLogSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :symptom
  has_one :date_master
end
