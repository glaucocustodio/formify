require 'formify'

class UsersForm
  include Formify
  main_model User

  validates :name, presence: true
end
