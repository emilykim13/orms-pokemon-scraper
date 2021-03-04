require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:[0], name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?,?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = ("SELECT * FROM pokemon WHERE id = ?")
        exe = db.execute(sql, id).flatten #if i used [0] or .first it wouldnt access the nested array and therefore i just got lucky with the first element being what i needed
        Pokemon.new(id:exe[0], name:exe[1], type:exe[2], db: db)
    end
    # binding.pry

end


