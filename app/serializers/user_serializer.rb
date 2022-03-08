class UserSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type 'users'
  def self.format_user(data)
    {
      'attributes': {
        'email': data.email,
        'api_key': data.api_key
      }
    }
  end
end
