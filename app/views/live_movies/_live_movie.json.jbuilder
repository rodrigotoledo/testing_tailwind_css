json.extract! live_movie, :id, :title, :artist_id, :short_description, :year, :created_at, :updated_at
json.url live_movie_url(live_movie, format: :json)
