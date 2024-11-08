# Código onde não houve aplicação do princípio SOLID
class UserProfile
  def initialize(name, email)
    @name = nome
    @email = email
  end

  def display_profile
    puts "Nome: #{@name}"
    puts "Email: #{@email}"
  end

  def save_to_file(filename)
    File.open(filename, 'w') do |file|
      file.puts "Nome: #{@name}"
      file.puts "Email: #{@email}"
    end
  end

  def send_welcome_email
    puts "Mandando mensagem de oi para #{@name} at #{@email}..."
  end
end

# Código corrigido

class UserProfile
  attr_reader :name, :email

  def initialize(name, email)
    @name = nome
    @email = email
  end

  def display_profile
    puts "Nome: #{@name}"
    puts "Email: #{@email}"
  end
end

class ProfileSaver
  def self.save_to_file(user_profile, filename)
    File.open(filename, 'w') do |file|
      file.puts "Nome: #{user_profile.name}"
      file.puts "Email: #{user_profile.email}"
    end
  end
end

class EmailSender
  def self.send_welcome_email(user_profile)
    puts "Mandando uma mensagem de oi para #{user_profile.name} at #{user_profile.email}..."
  end
end

user_profile = UserProfile.new("Alice", "alice@teste.com")
user_profile.display_profile
ProfileSaver.save_to_file(user_profile, "user_profile.txt")
EmailSender.send_welcome_email(user_profile)
