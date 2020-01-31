require_relative('../db/sqlrunner.rb')

class Owner

  attr_reader :id
  attr_accessor :name, :contact_number

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_number = options['contact_number']
  end

  def save()
    sql = "INSERT INTO owners (name, contact_number)
          VALUES ($1, $2) RETURNING id"
    values = [@name, @contact_number]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map{|owner| Owner.new(owner)}
  end

  def update_contact_details()
    sql = "UPDATE owners SET (name, contact_number) = ($1, $2)
          WHERE id = $3"
    values = [@name, @contact_number, @id]
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
    results = SqlRunner.run(sql, values)
    return Pet.new(results.first)
  end 


end