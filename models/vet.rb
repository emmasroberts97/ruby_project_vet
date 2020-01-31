require_relative('../db/sqlrunner.rb')

class Vet

  attr_accessor :name, :experience
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @experience = options['experience'].to_i
  end

  def save()
    sql = "INSERT INTO vets (name, experience)
           VALUES ($1, $2) RETURNING id"
    values = [@name, @experience]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM vets"
    results = SqlRunner.run(sql)
    return results.map{|vet| Vet.new(vet)}
  end

  def find_patients()
    sql = "SELECT * FROM pets WHERE pets.vet_details = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Pet.new(results.first)
  end

  def update_details()
    sql = "UPDATE vets SET (name, experience) = ($1, $2) WHERE id = $3"
    values = [@name, @experience, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM vets"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM vets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find(id)
    sql = "SELECT * FROM vets WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Vet.new(results.first)
  end

end
