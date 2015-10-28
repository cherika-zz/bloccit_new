class User < ActiveRecord::Base
  has_many :posts
  # we register an inline callback directly after the before_save callback.
  before_save {self.email = email.downcase}
  before_save :new_name
  before_save {self.role ||= :member}

  # a regular expression which defines a specific character pattern that we want to match against a string
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # we use validates function to ensure that name is present and has max/min length
  validates :name, length: { minimum: 1, maximum: 100}, presence: true

  # when a new user is created, they will be created with a valid password
  validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"
  # when updating a user's password, the updated password is also 6 characters long
  validates :password, length: {minimum: 6}, allow_blank: true

  # we validate that email is present, unique, case insensitive, has min/max length, and properly formatted
  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 100},
            format: {with: EMAIL_REGEX}

  has_secure_password

  enum role: [:member, :admin, :moderator]

  def new_name
    capitalized_name = []
    self.name.to_s.split(" ").each do |word|
      capitalized_name << "#{word[0].capitalize}#{word[1..-1]}"
    end
    self.name = capitalized_name.join(" ")
  end
end
