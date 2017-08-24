class AllergicReactionLogSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :symptom
end
