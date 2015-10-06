json.array!(@metakeys) do |metakey|
  json.extract! metakey, :id
  json.url metakey_url(metakey, format: :json)
end
