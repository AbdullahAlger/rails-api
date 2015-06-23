class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id

  def name
    object.name
  end

  def description
    object.description
  end

  def user_id
    object.user_id
  end
end
