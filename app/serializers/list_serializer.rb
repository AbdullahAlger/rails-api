class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :permissions, :user_id

  def name
    object.name
  end

  def permissions
    object.permissions
  end

  def user_id
    object.user_id
  end
end
