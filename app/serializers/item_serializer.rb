class ItemSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :list_id

  def body
    object.body
  end

  def user_id
    object.user_id
  end

  def list_id
    object.list_id
  end
end
