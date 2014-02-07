json.array!(@raitings) do |raiting|
  json.extract! raiting, :id
  json.url raiting_url(raiting, format: :json)
end
