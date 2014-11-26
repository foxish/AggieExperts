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

seed_uroles = [{:code => 'ADMIN',:description => 'System Administrator'},{:code => 'USER', :description => 'Aggie Expert User'}]

seed_uroles.each do |urole|
    Urole.create!(urole)
end

seed_users = [{:email=>'xavier@tamu.edu', :password =>'Temp123', :status_id=>4, :urole_id=> 2},
{:email=>'samuel@tamu.edu',:password =>'Temp123', :status_id=>4, :urole_id=> 2},
{:email=>'singh@tamu.edu',:password =>'Temp123', :status_id=>4, :urole_id=> 2},
{:email=>'patterson@tamu.edu',:password =>'Temp123', :status_id=>4, :urole_id=> 2},
{:email=>'fox@tamu.edu',:password =>'Temp123', :status_id=>4, :urole_id=> 2},
{:email=>'saisujithreddy@tamu.edu',:password =>'Temp123',  :urole_id=> 1}
]


seed_users.each do |user|
    User.create!(user)
end



seed_keywords = [{:key => "Antiquity"},
                 {:key => "Medieval"},
                 {:key => "Enlightenment"},
                 {:key => "Modern"},
                 {:key => "Communism"},
                 {:key => "Democracy"},
                 {:key => "Democratic"},
                 {:key => "Republican"},
                 {:key => "Libertarian"}]

seed_keywords.each do |keyword|
    Keyword.create!(keyword)
end


seed_profiles = [{:user_id => 1, 
                  :name =>'Charles Xavier',
                  :description=>'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
                  :phone=> 9790001122,
                  :email=> 'xavier@tamu.edu',
                  :title=> 'Dr.'},
                 {:user_id => 2, 
                  :name =>'John Samuel', 
                  :description=>'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.',
                  :phone=> 9790002233,
                  :email=> 'samuel@tamu.edu',
                  :title=> 'Prof.'},
                 {:user_id => 3, 
                  :name =>'Jacob Singh', 
                  :description=>'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat',
                  :phone=> 9790004455,
                  :email=> 'singh@tamu.edu',
                  :title=> 'Mr.'},
                 {:user_id => 4, 
                  :name =>'Armando Patterson', 
                  :description=>'sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
                  :phone=> 9790001122,
                  :email=> 'patterson@tamu.edu',
                  :title=> 'Miss'},
                 {:user_id => 5, 
                  :name =>'David Fox', 
                  :description=>' et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed',
                  :phone=> 9790001122,
                  :email=> 'fox@tamu.edu',
                  :title=> 'Mrs.'}]
                  
seed_profiles.each do |profile|
    Profile.create!(profile)
end

seed_pkeywords = [
                   {:user_id => 1, :keyword_id => 1},
                   {:user_id => 1, :keyword_id => 2},
                   {:user_id => 1, :keyword_id => 3},
                   {:user_id => 1, :keyword_id => 4},
                   {:user_id => 1, :keyword_id => 5},
                   {:user_id => 2, :keyword_id => 1},
                   {:user_id => 2, :keyword_id => 3},
                   {:user_id => 2, :keyword_id => 5},
                   {:user_id => 2, :keyword_id => 6},
                   {:user_id => 2, :keyword_id => 7},
                   {:user_id => 2, :keyword_id => 8},
                   {:user_id => 3, :keyword_id => 1},
                   {:user_id => 3, :keyword_id => 2},
                   {:user_id => 3, :keyword_id => 3},
                   {:user_id => 3, :keyword_id => 5},
                   {:user_id => 3, :keyword_id => 6},
                   {:user_id => 3, :keyword_id => 7},
                   {:user_id => 3, :keyword_id => 8},
                   {:user_id => 3, :keyword_id => 9},
                   {:user_id => 4, :keyword_id => 3},
                   {:user_id => 5, :keyword_id => 1},
                   {:user_id => 5, :keyword_id => 3},
                   {:user_id => 5, :keyword_id => 4},
                   {:user_id => 5, :keyword_id => 7},
                 ]


seed_pkeywords.each do |pkeyword|
    Pkeyword.create!(pkeyword)
end

seed_publications = [
    {:user_id => 1, :title =>'FlowDroid: Precise Context, Flow, Field, Object-sensitive and Lifecycle-aware Taint Analysis for Android Apps', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'A Few Billion Lines of Code Later: Using Static Analysis to Find Bugs in the Real World', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'Parallel ProgrammingMust Be Deterministic by Default', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'Line-Up: A Complete and Automatic Linearizability Checker', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'PARROT: A Practical Runtime for Deterministic, Stable, and Reliable Threads', :url=>'http://www.pub1.com'},
    {:user_id => 1, :title =>'Static and dynamic analysis: synergy and duality', :url=>'http://www.pub1.com'},
]

seed_publications.each do |pub|
  Ppublication.create!(pub)
end