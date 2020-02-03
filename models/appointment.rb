require_relative('../db/sqlrunner.rb')

class Appointment

  attr_accessor :check_in, :check_out, :pet_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @check_in = options['check_in']
    @check_out = options['check_out']
    @pet_id = options['pet_id']
  end

  def save()
    sql = "INSERT INTO appointments (check_in, check_out, pet_id)
          VALUES ($1, $2, $3) RETURNING id"
    values = [@check_in, @check_out, @pet_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE appointments SET (check_in, check_out, pet_id) = ($1, $2, $3)
           WHERE id = $4"
    values = [@check_in, @check_out, @pet_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM appointments"
    results = SqlRunner.run(sql)
    return results.map{|appointment| Appointment.new(appointment)}
  end

  def self.delete_all()
    sql = "DELETE FROM appointments"
    SqlRunner.run(sql)
  end

  def find_pet()
    sql = "SELECT * FROM pets WHERE id = $1"
    values = [@pet_id]
    results = SqlRunner.run(sql, values)
    return Pet.new(results.first)
  end


end