json.extract! attachment, :id, :title, :description, :file, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
