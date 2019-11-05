class Author < ApplicationRecord

    validates :first_name, presence: true, length: {minimum: 1}
    validates :last_name, presence: true, length: {minimum: 1}
    validates :homepage, presence: true, length: {minimum: 1}

    def name
        first_name + " " + last_name
    end
end
