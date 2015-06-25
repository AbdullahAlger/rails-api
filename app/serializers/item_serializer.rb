class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :list_id

  def description
    object.description
  end

  def user_id
    object.user_id
  end

  def list_id
    object.list_id
  end
end
