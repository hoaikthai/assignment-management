class UserSerializer < BaseSerializer
  attributes :id, :email, :name, :gender, :birthday, :address, :role
end