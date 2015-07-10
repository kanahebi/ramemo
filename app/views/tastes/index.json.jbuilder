json.array!(@tastes) do |taste|
  json.extract! taste, :id, :name
  json.url taste_url(taste, format: :json)
end
