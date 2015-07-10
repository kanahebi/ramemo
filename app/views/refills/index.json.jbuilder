json.array!(@refills) do |refill|
  json.extract! refill, :id, :name
  json.url refill_url(refill, format: :json)
end
