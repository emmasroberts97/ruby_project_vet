require_relative('../db/sqlrunner.rb')

class Pet

  attr_reader :id, :name, :dob, :species
  attr_accessor :owner_details, :vet_details, :treatment_notes, :url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @dob = options['dob']
    @species = options['species']
    @owner_details = options['owner_details'].to_i
    @vet_details = options['vet_details'].to_i
    @treatment_notes = options['treatment_notes']
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO pets
    (name, dob, species, owner_details, vet_details, treatment_notes, url)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id"
    values = [@name, @dob, @species, @owner_details, @vet_details, @treatment_notes, @url]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM pets"
    results = SqlRunner.run(sql)
    return results.map{|pet| Pet.new(pet)}
  end

  def update_pet()
    sql = "UPDATE pets SET (name, dob, species, owner_details, vet_details, treatment_notes, url) =
           ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
    values = [@name, @dob, @species, @owner_details, @vet_details, @treatment_notes, @url, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM pets"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM pets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_owner()
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_details]
    results = SqlRunner.run(sql, values)
    return Owner.new(results.first)
  end

  def find_vet()
    sql = "SELECT * FROM vets WHERE id = $1"
    values = [@vet_details]
    results = SqlRunner.run(sql, values)
    return Vet.new(results.first)
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Pet.new(results.first)
  end

  def find_pet_appointment()
    sql = "SELECT * FROM appointments WHERE pet_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    if results.first != nil
      return Appointment.new(results.first)
    else
      return nil
    end
  end


# decided to keep date of birth
  # def get_age
  #   age = Date.today.year - Date.parse(@dob).year
  #   month = Date.today.month - Date.parse(@dob).month
  #   if age >= 1
  #     return "#{age} year(s) old"
  #   elsif age < 1
  #     return "#{month} month(s) old"
  #   end
  # end


end
