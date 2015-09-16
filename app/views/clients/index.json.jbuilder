json.array!(clients) do |client|
  json.extract! client, :id, :name, :dob_formatted
  json.url client_url(client, format: :json)
end
