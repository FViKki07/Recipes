class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :login, presence: true, uniqueness: true, format: { with: /[A-Za-z0-9]+@\w+\.\w+/, message: "Wrong email" }

end
