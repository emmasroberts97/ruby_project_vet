require_relative('../db/sqlrunner.rb')

class Owner

  attr_reader :id
  attr_accessor :name, :contact_number, :registration, :url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_number = options['contact_number']
    @registration = options['registration']
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO owners (name, contact_number, registration, url)
          VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @contact_number, @registration, @url]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map{|owner| Owner.new(owner)}
  end

  def update_contact_details()
    sql = "UPDATE owners SET (name, contact_number, registration, url) = ($1, $2, $3, $4)
          WHERE id = $5"
    values = [@name, @contact_number, @registration, @url, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_pets()
    sql = "SELECT * FROM pets WHERE pets.owner_details = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    pets_data = result.map{|pet| Pet.new(pet)}
    return pets_data
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Owner.new(results.first)
  end


end
