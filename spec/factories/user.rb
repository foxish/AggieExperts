FactoryGirl.define do
  factory :user do
    id 2
    email "admin_factory@tamu.edu"
    encrypted_password "admin_factory"
    status_id 4
    urole_id 1
  end
end
