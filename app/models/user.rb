class User < ApplicationRecord
    has_secure_password
    validates :user, presence: true
    validates :login, format: { with: /[A-Za-z0-9]+@{1}@\.\w+/ , message: 'Неправильный логин'}
    validate :validate_for_login
    
    def validate_for_login
        user = User.find_by(login: :login)
        if user.present?
          errors.add(:login, 'Такой логин уже есть')
        end
    end
end
