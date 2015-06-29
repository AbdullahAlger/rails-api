class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :list_id
end
