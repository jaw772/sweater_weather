class BackgroundSerializer
  include JSONAPI::Serializer
  set_id 'null'
  set_type 'image'
  def self.format_background(data, location)
    {
      'attributes': {
        'image': {
          'location': location,
          'image_url': data[:photos].first[:src][:original],
          'credit': {
            'source': 'pexels.com',
            'author': data[:photos].first[:photographer],
            'author_url': data[:photos].first[:photographer_url]
          }
        }
      }
    }
  end
end
