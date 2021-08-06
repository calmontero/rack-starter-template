class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/books" && req.get?
      books = Book.all
      return [
        200, { 'Content-Type' => 'application/json' }, 
        [ books.to_json ]
      ]

    elsif req.path.match(/books/) && req.post?
      body = JSON.parse(req.body.read)
      book = Book.create(body)
      return [
        200, { 'Content-Type' => 'application/json' }, 
        [ book.to_json ]
      ]

    elsif req.path == "/authors" && req.get?
      authors = Author.all
      return [
        200, { 'Content-Type' => 'application/json' }, 
        [ authors.to_json ]
      ]

    elsif req.path.match(/authors/) && req.get?
        id = req.path.split("/")[2]
        author = Author.find_by(id: id)
        
        if author
          books = author.books
          author_res = {
            name: author.name,
            bio: author.bio,
            books: books
          }
          return [
            200, { 'Content-Type' => 'application/json' }, 
            [ author_res.to_json ]
          ]
        else
          return [
            204, { 'Content-Type' => 'application/json' }, 
            [ { error: "author not found" }.to_json ]
          ]
        end

    else
      res.write "Path Not Found"

    end

    res.finish
  end

end