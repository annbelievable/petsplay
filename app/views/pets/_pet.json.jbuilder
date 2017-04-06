json.extract! pet, :id, :name, :types, :description, :age, :gender, :breed, :available_datetimes, :photos, :user_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
