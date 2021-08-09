class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    #PROGRAMS ROUTES

    #Programs Index
    if req.path == ("/programs") && req.get?
      return [
        200, { 'Content-Type' => 'application/json' }, 
        [ Program.all.to_json ]
      ]

    end

    #Program Create
    if req.path == ("/programs") && req.post?
      body = JSON.parse(req.body.read)
      program = Program.create(body)
      return [
        201, { 'Content-Type' => 'application/json' }, 
        [ program.to_json ]
      ]

    end

    #Program Show
    if req.path.match("/programs/") && req.get?
      id = req.path.split("/")[2]
      begin
        program = Program.find(id)
        return [
          200, { 'Content-Type' => 'application/json' }, 
          [ program.to_json ]
        ]
      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
        [{message: "Program not found"}.to_json]]
      end
    end

    #Program Update
    if req.path.match("/programs/") && req.patch?
      id = req.path.split("/")[2]
      body = JSON.parse(req.body.read)
      begin
        program = Program.find(id)
        program.update(body)
        return [
          202, 
          { 'Content-Type' => 'application/json' },
          [ program.to_json]
        ]

      rescue ActiveRecord::RecordNotFound
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Program not found"}.to_json]]
      rescue ActiveRecord::UnknownAttributeError
        return [
          422, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Could not process your update request"}.to_json]]
      end
    end

    #Program Delete
    if req.path.match("/programs/") && req.delete?
      id = req.path.split("/")[2]
      begin
        program = Program.find(id)
        program.destroy
        return [
          200, 
          { 'Content-Type' => 'application/json' },
          [ {message: "Program Destroyed"}.to_json]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Program not found"}.to_json]]
      end
    end
###############################################
    #FANS ROUTES

    #Fans Index
    if req.path == ("/fans") && req.get?
      return [
        200, { 'Content-Type' => 'application/json' }, 
        [ Fan.all.to_json ]
      ]

    end

    #Fan Create
    if req.path == ("/fans") && req.post?
      body = JSON.parse(req.body.read)
      fan = Fan.create(body)
      return [
        201, { 'Content-Type' => 'application/json' }, 
        [ fan.to_json ]
      ]

    end

    #Fan Show
    if req.path.match("/fans/") && req.get?
      id = req.path.split("/")[2]
      begin
        fan = Fan.find(id)
        return [
          200, { 'Content-Type' => 'application/json' }, 
          [ fan.to_json ]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
        [{message: "Fan not found"}.to_json]]
      end
    end

    #Fan Update
    if req.path.match("/fans/") && req.patch?
      id = req.path.split("/")[2]
      body = JSON.parse(req.body.read)
      begin
        fan = Fan.find(id)
        fan.update(body)
        return [
          202, 
          { 'Content-Type' => 'application/json' },
          [ fan.to_json]
        ]

      rescue ActiveRecord::RecordNotFound
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Fan not found"}.to_json]]
      rescue ActiveRecord::UnknownAttributeError
        return [
          422, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Could not process your update request"}.to_json]]
      end
    end

    #Fan Delete
    if req.path.match("/fans/") && req.delete?
      id = req.path.split("/")[2]
      begin
        fan = Fan.find(id)
        fan.destroy
        return [
          200, 
          { 'Content-Type' => 'application/json' },
          [ {message: "Fan Destroyed"}.to_json]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Fan not found"}.to_json]]
      end
    end
 
###############################################
    #REGISTER ROUTES
    
    #Registers of Fans by Program Show 
    if req.path.match("/registers/") && req.get?
      id = req.path.split("/")[2]
      begin
        program = Program.find(id)
        registers = program.registers
        program_res = {
            desc: program.desc,
            registers: registers
        }

        return [
          200, { 'Content-Type' => 'application/json' }, 
          [ program_res.to_json ]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
        [{message: "Program not found"}.to_json]]
      end
    end

    #Registers of Program by Fan Show 
    if req.path.match("/registersfan/") && req.get?
      id = req.path.split("/")[2]
      begin
        fan = Fan.find(id)
        registers = fan.registers
        fan_res = {
            name: fan.name,
            registers: registers
        }

        return [
          200, { 'Content-Type' => 'application/json' }, 
          [ fan_res.to_json ]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
        [{message: "Program not found"}.to_json]]
      end
    end

    #Register Program Create
    if req.path == ("/registers") && req.post?
      body = JSON.parse(req.body.read)
      register = Register.create(body)
      return [
        201, { 'Content-Type' => 'application/json' }, 
        [ register.to_json ]
      ]

    end

    #Register Fans of a Program Delete
    if req.path.match("/registersfan/") && req.delete?
      id = req.path.split("/")[2]
      begin
        Register.where(:program_id => id).destroy_all
        return [
          200, 
          { 'Content-Type' => 'application/json' },
          [ {message: "Register Destroyed"}.to_json]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Register not found"}.to_json]]
      end
    end

    #Register Program of a Fan Delete
    if req.path.match("/registersprogram/") && req.delete?
      id = req.path.split("/")[2]
      begin
        register = Register.find(id)
        register.destroy
        return [
          200, 
          { 'Content-Type' => 'application/json' },
          [ {message: "Register Destroyed"}.to_json]
        ]

      rescue
        return [
          404, 
          {'Content-Type' => 'application/json'}, 
          [{message: "Register not found"}.to_json]]
      end
    end

    res.finish
  end

end