class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  before_validation :set_default_role


  private
  def set_default_role
    self.role ||= Role.find_by_name('member')
  end

  def admin?
    self.role_id == '3' # role_id == '3' 表示 admin
  end



end
