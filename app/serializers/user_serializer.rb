# frozen_string_literal: true
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :date_reference_id
end
