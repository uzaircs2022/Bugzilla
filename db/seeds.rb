manager = User.new(
  :name                  => "Syed Uzair",
  :email                 => "syed.uzair@devsinc.com",
  :password              => "password",
  :password_confirmation => "password",
  :usertype              => "Manager"
)
manager.skip_confirmation!
manager.save!

developer1 = User.new(
  :name                  => "Developer1",
  :email                 => "suzair2018@namal.edu.pk",
  :password              => "password",
  :password_confirmation => "password",
  :usertype              => "Developer"
)
developer1.skip_confirmation!
developer1.save!

developer2 = User.new(
  :name                  => "Developer2",
  :email                 => "suzair2018@gmail.com",
  :password              => "password",
  :password_confirmation => "password",
  :usertype              => "Developer"
)
developer2.skip_confirmation!
developer2.save!

qa = User.new(
  :name                  => "QA",
  :email                 => "syeduzair222.sus@gmail.com",
  :password              => "password",
  :password_confirmation => "password",
  :usertype              => "QA"
)
qa.skip_confirmation!
qa.save!

ror = manager.projects.create(
  :title                => "ROR",
  :description          => "A project of ROR",
  :creator              => manager
)

js = manager.projects.create(
  :title                => "JAVASCRIPT",
  :description          => "A project of JAVASCRIPT",
  :creator              => manager
)

mint = manager.projects.create(
  :title                => "MINT",
  :description          => "A project of MINT",
  :creator              => manager
)

ror_bug = ror.bugs.create(
  :title                => "ROR BUG",
  :description          => "A bug in ROR Project",
  :bugtype              => "Bug",
  :status               => "New",
  :project              => ror,
  :reported_by          => qa
)
ror_bug.image.attach(io: File.open(File.join(Rails.root, "/app/assets/images/seed/java.png")), filename: 'java.png')

ror_feature = ror.bugs.create(
  :title                => "ROR Feature",
  :description          => "A Feature in ROR Project",
  :bugtype              => "Feature",
  :status               => "New",
  :project              => ror,
  :reported_by          => qa
)
ror_feature.image.attach(io: File.open(File.join(Rails.root, "/app/assets/images/seed/java.png")), filename: 'java.png')


js_bug = js.bugs.create(
  :title                => "JS BUG",
  :description          => "A bug in js Project",
  :bugtype              => "Bug",
  :status               => "New",
  :project              => js,
  :reported_by          => qa
)
js_bug.image.attach(io: File.open(File.join(Rails.root, "/app/assets/images/seed/java.png")), filename: 'java.png')

js_feature = js.bugs.create(
  :title                => "JS Feature",
  :description          => "A Feature in js Project",
  :bugtype              => "Feature",
  :status               => "New",
  :project              => js,
  :reported_by          => qa
)
js_feature.image.attach(io: File.open(File.join(Rails.root, "/app/assets/images/seed/java.png")), filename: 'java.png')

mint_bug = mint.bugs.create(
  :title                => "MINT BUG",
  :description          => "A bug in mint Project",
  :bugtype              => "Bug",
  :status               => "New",
  :project              => mint,
  :reported_by          => qa
)
mint_bug.image.attach(io: File.open(File.join(Rails.root, "/app/assets/images/seed/java.png")), filename: 'java.png')

mint_feature = mint.bugs.create(
  :title                => "Mint Feature",
  :description          => "A Feature in mint Project",
  :bugtype              => "Feature",
  :status               => "New",
  :project              => mint,
  :reported_by          => qa
)
mint_feature.image.attach(io: File.open(File.join(Rails.root, "/app/assets/images/seed/java.png")), filename: 'java.png')
