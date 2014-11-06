# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_status = [{:code => 'PACT',:description => 'Pending Activation'},{:code => 'DISABLE', :description => 'Disabled'},
{:code => 'PAPP',:description => 'Pending Approval'},{:code => 'ACTIVE',:description =>'Active'}]

seed_status.each do |status|
	Status.create!(status)
end

seed_users = [{:email=>'prithvi.sakuru@tamu.edu', :password =>'Temp123', :activation_date=>'2014-11-01', :status_id=>1},
{:email=>'anirudh4444@tamu.edu',:password =>'Temp123',:activation_date=>'2014-11-01', :status_id=>1},
{:email=>'arunxls@tamu.edu',:password =>'Temp123',:activation_date=>'2014-11-01', :status_id=>1},
{:email=>'malavikam92@tamu.edu',:password =>'Temp123',:activation_date=>'2014-11-01', :status_id=>1},
{:email=>'vsiravara@tamu.edu',:password =>'Temp123',:activation_date=>'2014-11-01', :status_id=>1},
{:email=>'saisujithreddy@tamu.edu',:password =>'Temp123',:activation_date=>'2014-11-01', :status_id=>1}
]


seed_users.each do |user|
	User.create!(user)
end