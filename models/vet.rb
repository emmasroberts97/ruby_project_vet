require_relative('../db/sqlrunner.rb')

class Vet

  attr_accessor :name, :experience, :url
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] if options['name']
    @experience = options['experience'].to_i if options['experience']
    @url = options['url'] if options['url']
  end

  def save()
    sql = "INSERT INTO vets (name, experience, url)
           VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @experience, @url]
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
    result = SqlRunner.run(sql, values)
    pets_data = result.map{|pet| Pet.new(pet)}
    return pets_data
  end

  def update_details()
    sql = "UPDATE vets SET (name, experience, url) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @experience, @url, @id]
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

  def self.find(id)
    sql = "SELECT * FROM vets WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Vet.new(results.first)
  end

end
