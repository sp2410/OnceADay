json.extract! post, :id, :title, :posted_on, :created_at, :updated_at
json.url post_url(post, format: :json)
