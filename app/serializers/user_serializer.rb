class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  def full_name
    object.name
  end

  def email
    object.email
  end
end
