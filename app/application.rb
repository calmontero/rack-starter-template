class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    #PUBLISHERS ROUTES

    #Publishers Index
    if req.path == ("/publishers") && req.get?
      return [
        200, { 'Content-Type' => 'application/json' }, 
        [ Publisher.all.to_json ]
      ]

    end

    #Publisher Create
    if req.path == ("/publishers") && req.post?
      body = JSON.parse(req.body.read)
      publisher = Publisher.create(body)
      return [
        201, { 'Content-Type' => 'application/json' }, 
        [ publisher.to_json ]
      ]

    end

    #Publisher Show
    if req.path.match("/publishers/") && req.get?
      id = req.path.split("/")[2]
      begin
        publisher = Publisher.find(id)
        characters = publisher.characters
        publisher_res = {
          name: publisher.name,
          history: publisher.history,
          url: publisher.image_url,
          characters: characters
        }
        return [
          200, { 'Content-Type' => 'application/json' }, 
          [ publisher_res.to_json ]
        ]
      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
        [{message: "Publisher not found"}.to_json]]
      end
    end

    #Publisher Update
    if req.path.match("/publishers/") && req.patch?
      id = req.path.split("/")[2]
      body = JSON.parse(req.body.read)
      begin
        publisher = Publisher.find(id)
        publisher.update(body)
        return [
          202, 
          { 'Content-Type' => 'application/json' },
          [ publisher.to_json]
        ]

      rescue ActiveRecord::RecordNotFound
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Publisher not found"}.to_json]]
      rescue ActiveRecord::UnknownAttributeError
        return [
          422, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Could not process your update request"}.to_json]]
      end
    end

    #Publisher Delete
    if req.path.match("/publishers/") && req.delete?
      id = req.path.split("/")[2]
      begin
        publisher = Publisher.find(id)
        publisher.destroy
        return [
          200, 
          { 'Content-Type' => 'application/json' },
          [ {message: "Publisher Destroyed"}.to_json]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Publisher not found"}.to_json]]
      end
    end
###############################################
    #CHARACTERS ROUTES

    #Character Index
    if req.path == ("/characters") && req.get?
      return [
        200, { 'Content-Type' => 'application/json' }, 
        [ Character.all.to_json ]
      ]

    end

    #Character Create
    if req.path == ("/characters") && req.post?
      body = JSON.parse(req.body.read)
      character = Character.create(body)
      return [
        201, { 'Content-Type' => 'application/json' }, 
        [ character.to_json ]
      ]

    end

    #Character Show
    if req.path.match("/characters/") && req.get?
      id = req.path.split("/")[2]
      
      begin
        #character = Character.find(id)
        character = Character.where(publisher_id: id)
        return [
          200, { 'Content-Type' => 'application/json' }, 
          [ character.to_json ]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
        [{message: "Character not found"}.to_json]]
      end
    end

    #Character Update
    if req.path.match("/characters/") && req.patch?
      id = req.path.split("/")[2]
      body = JSON.parse(req.body.read)
      begin
        character = Character.find(id)
        character.update(body)
        return [
          202, 
          { 'Content-Type' => 'application/json' },
          [ character.to_json]
        ]

      rescue ActiveRecord::RecordNotFound
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Character not found"}.to_json]]
      rescue ActiveRecord::UnknownAttributeError
        return [
          422, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Could not process your update request"}.to_json]]
      end
    end

    #Character Delete
    if req.path.match("/characters/") && req.delete?
      id = req.path.split("/")[2]
      begin
        character = Character.find(id)
        character.destroy
        return [
          200, 
          { 'Content-Type' => 'application/json' },
          [ {message: "Character Destroyed"}.to_json]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Character not found"}.to_json]]
      end
    end
 
    res.finish
  end

end