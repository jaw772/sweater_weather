class UserSerializer
  include JSONAPI::Serializer
  def self.format_user(data)
    {
      'data':{
        'type': 'users',
        'id': data.id.to_s,
        'attributes': {
          'email': data.email,
          'api_key': data.api_key
        }
      }
    }
  end
end
