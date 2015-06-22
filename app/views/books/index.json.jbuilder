json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :ISBN, :price
  json.url book_url(book, format: :json)
end
