class DateMasterSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_many :user
end
