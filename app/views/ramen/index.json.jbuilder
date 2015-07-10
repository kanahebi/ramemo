json.array!(@ramen) do |raman|
  json.extract! raman, :id, :name, :picture
  json.url raman_url(raman, format: :json)
end
