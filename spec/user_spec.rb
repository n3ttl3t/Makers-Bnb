require 'user'

describe User do
  describe '.create' do
    it "creates a new entry of an account in the database" do
      user = User.create(name: 'Roxana Smith', username: 'SaltyRox', email: 'roxxmoxx@gmail.com', password: 'roxurulez1234')
      
      expect(user).to be_a User
      expect(user.name).to eq 'Roxana Smith'
      expect(user.username).to eq 'SaltyRox'
      expect(user.email).to eq 'roxxmoxx@gmail.com'
      expect(user.password).to eq 'roxurulez1234'
    end
  end
end
