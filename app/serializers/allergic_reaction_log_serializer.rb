class AllergicReactionLogSerializer < ActiveModel::Serializer
  attributes :id, :time, :symptom
  has_one :date_master
end
