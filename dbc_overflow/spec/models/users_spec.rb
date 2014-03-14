require 'spec_helper'

describe User do

  it {should validate_uniqueness_of :email}
  it {should validate_confirmation_of :password}
  it { should ensure_length_of(:password).is_at_least(5).is_at_most(40)}
  it { should have_secure_password }
  it { should allow_mass_assignment_of(:username) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  context 'associations' do
    it { should have_many(:answers) }
    it { should have_many(:questions) }
    it { should have_many(:comments) }
  end

end


