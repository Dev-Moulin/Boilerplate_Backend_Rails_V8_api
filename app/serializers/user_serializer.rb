class UserSerializer
  include JSONAPI::Serializer
  
  attributes :id, :email, :created_at

  attribute :created_date do |object|
    object.created_at.strftime('%d/%m/%Y')
  end
end
