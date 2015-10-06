json.array!(@facets) do |facet|
  json.extract! facet, :id
  json.url facet_url(facet, format: :json)
end
