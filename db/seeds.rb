# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
# load(Rails.root.join("db", "seeds.rb"))




# skills
Skill.destroy_all
Skill.create( :name_cn => '设计师', :name_en => 'Designer' )
Skill.create( :name_cn => '开发员', :name_en => 'Developer' )
Skill.create( :name_cn => '市场', :name_en => 'Marketing' )
# strategy : 策略
Skill.create( :name_cn => '企业家', :name_en => 'Entrepreneur' )
Skill.create( :name_cn => '产品经理', :name_en => 'Product manager' )
Skill.create( :name_cn => '投资者', :name_en => 'Investor' )
Skill.create( :name_cn => '用户经验', :name_en => 'User experience' )
Skill.create( :name_cn => '公共媒体', :name_en => 'Social media' )
Skill.create( :name_cn => '媒体', :name_en => 'Media' )
Skill.create( :name_cn => '其他', :name_en => 'Other' )

# company_types
CompanyType.destroy_all
CompanyType.create( :name_cn => '服务提供者', :name_en => "Service provider")
CompanyType.create( :name_cn => '代理/顾问', :name_en => "Agency/Consultancy")

CompanyType.create( :name_cn => '启动资金', :name_en => "Funded startup")
CompanyType.create( :name_cn => '早期开发', :name_en => "Early stage startup")
CompanyType.create( :name_cn => '金融公司', :name_en => "Financial firm")
CompanyType.create( :name_cn => '孵化器', :name_en => "Incubator")
CompanyType.create( :name_cn => '办公区域', :name_en => "Office space")
CompanyType.create( :name_cn => '办公区域', :name_en => "Other")

# event_types
EventType.destroy_all
EventType.create( :name_cn => '年度活动', :name_en => "Annual event")
EventType.create( :name_cn => '经常会面', :name_en => "Regular meetup")
EventType.create( :name_cn => '社区活动', :name_en => "Community event")
EventType.create( :name_cn => '企业家活动', :name_en => "Entrepreneur event")
EventType.create( :name_cn => '设计师活动', :name_en => "Designer event")
EventType.create( :name_cn => '开发员活动', :name_en => "Developer event")
EventType.create( :name_cn => '手机活动', :name_en => "Mobile event")
EventType.create( :name_cn => '手机活动', :name_en => "Other")

# job_types
JobType.destroy_all
# JobType.create( :name_cn => 'Fulltime', :name_en => "Fulltime", :label=>"label-important")
# JobType.create( :name_cn => 'Freelance', :name_en => "Freelance", :label=>"label-warning")
# JobType.create( :name_cn => 'Internship', :name_en => "Internship", :label=>"label-inverse")
# JobType.create( :name_cn => 'Co-founder', :name_en => "Co-founder", :label=>"label-success")
# JobType.create( :name_cn => 'Volunteer', :name_en => "Volunteer", :label=>"label-info")
JobType.create( :name_cn => 'Fulltime', :name_en => "Fulltime", :label=>"")
JobType.create( :name_cn => 'Freelance', :name_en => "Freelance", :label=>"")
JobType.create( :name_cn => 'Internship', :name_en => "Internship", :label=>"")
JobType.create( :name_cn => 'Co-founder', :name_en => "Co-founder", :label=>"")
JobType.create( :name_cn => 'Volunteer', :name_en => "Volunteer", :label=>"")





####################################
###### PEOPLE 
####################################


User.destroy_all
sacha = User.create(
	:email => "sacha.guyon@gmail.com",
	:password => 'sacha',
	:password_confirmation => 'sacha',
	:admin => 1
	)	
gab = User.create(
	:email => "byubyu@gmail.com",
	:password => 'romero',
	:password_confirmation => 'romero',
	:admin => 1
	)	


# adresses =
# [
# 		"269 Zhaojiabang road Shanghai",
# 		"1709 Beijing west road Shanghai",
# 		"50 Yongjia road Shanghai",
# 		"800 Changde road shanghai",
# 		"1000 Century avenue Shanghai",
# ]

adresses =
[
	[
		"269 Zhaojiabang road Shanghai",
		31.202791,
 		121.461358
 	],
 	[
		"1709 Beijing west road Shanghai",
		31.225228,
 		121.443494
 	],
	[
		"50 Yongjia road Shanghai",
		31.210098,
 		121.461308
 	],
	[
		"800 Changde road shanghai",
		31.233576,
 		121.442687
 	],	
	[
		"1000 Century avenue Shanghai",
		31.231793,
 		121.519348
 	]
]

photos =
	["nightlife1-600x400.jpeg",
	"nightlife3-600x400.jpeg",
	"nightlife6-600x400.jpeg",
	"people1-600x400.jpeg",
	"people5-600x400.jpeg",
	"people6-600x400.jpeg",
	"people9-600x400.jpeg"]

positions =
	["Wannabe entrepreneur",
	"Weibo expert",
	"Lead developer",
	"Marketing specialist",
	"Angel investor",
	"Art director",
	"Pixel artist",
	"3d artist",
	"Rails ninja"]

Person.destroy_all

# Sacha
dir = File.join(Rails.root, "public/samples")
item = "sacha.jpg"
image = File.join(dir,item)
p = Person.create(
	:name_en => "Sacha Guyon",
	:name_cn => "古咏",
	:image => File.open(image),
	:position => "digital consultant",
	:description => "Hello !",
	:twitter => 'http://www.twitter.com/sa__cha',
	:weibo => 'http://www.weibo.com/1842061274',
	:website => 'http://www.sguyon.com',
	:blog => 'http://www.google.com',
	:user_id => sacha.id
	)
p.skills << Skill.all.sample(3)

# Gab
dir = File.join(Rails.root, "public/samples")
item = "gab.jpg"
image = File.join(dir,item)
p = Person.create(
	:name_en => "Gabriel Jorby",
	:name_cn => "龙家宝",
	:image => File.open(image),
	:position => "art director",
	:description => "Hello !",
	:twitter => 'http://www.twitter.com/gabyu',
	:weibo => 'http://www.weibo.com/xxx',
	:website => 'http://www.gabyu.com',
	:blog => 'http://www.gabyu.com',
	:user_id => gab.id
	)
p.skills << Skill.all.sample(3)




(1..4).each do |n|
	num = Random.rand(5)+1
	dir = File.join(Rails.root, "public/samples")
	item = "p" + num.to_s + ".jpg"
	image = File.join(dir,item)
	puts image
	name=Forgery(:name).full_name
	description=Forgery(:lorem_ipsum).words(30)
	position= positions[Random.rand(positions.length)]
	email = Forgery(:internet).email_address
	u = User.create(
	:email => email,
	:password => 'sacha',
	:password_confirmation => 'sacha',
	)	
	p = Person.create(
		:name_en => name,
		:name_cn => "中文名字",
		:image => File.open(image),
		:position => position,
		:description => description,
		:twitter => 'shanghaitech',
		:weibo => 'shanghaitech',
		:website => 'http://www.google.com',
		:blog => 'http://www.google.com',
		:user_id => u.id
		)
	p.skills << Skill.all.sample(3)

end




####################################
###### COMPANIES  
####################################
Company.destroy_all
nu = Random.rand(5)
num = Random.rand(5)+1
dir = File.join(Rails.root, "public/samples")
item = "c" + num.to_s + ".jpg"
image = File.join(dir,item)
title = "Guangzhou Nasack Web Design Studio"
link = "http://www.nextstepdirectory.com/graphic-web-design/guangzhou-nasack-web-design-studio"
description = "Nasack is an affordable web design and development studio based in Guangzhou, China. We offer nice and clean web design, PHP development, ecommerce website, Google SEO, mobile applications, graphic design, print and other services."
comp = Company.create(
	:user_id => User.first.id,
	:name_en => title,
	:name_cn => "中文名字",
	:title => title,
	:description => description,
	:website => link,
	:twitter => 'shanghaitech',
	:weibo => 'shanghaitech',
	:image => File.open(image),
	:adress => adresses[nu][0],
	:longitude => adresses[nu][2],
	:latitude => adresses[nu][1],
  :company_types => CompanyType.all.sample(2)
)

# (1..10).each do |n|
# 	Person.all.sample.companies << comp
# end

nu = Random.rand(5)
num = Random.rand(5)+1
dir = File.join(Rails.root, "public/samples")
item = "c" + num.to_s + ".jpg"
image = File.join(dir,item)
email=Forgery(:internet).email_address
title = "Worthingtonbrown China"
link = "http://www.nextstepdirectory.com/graphic-web-design/worthingtonbrown-china"
description = "WorthingtonBrown is Hangzhou&#039;s only British graphic design company. We have offices in both China and the UK."

comp = Company.create(
	:user_id => User.first.id,
	:name_en => title,
	:name_cn => "中文名字",
	:description => description,
	:website => link,
	:twitter => 'shanghaitech',
	:weibo => 'shanghaitech',
	:blog_feed => 'http://www.google.com',
	:adress => adresses[nu],
	:image => File.open(image),
	:adress => adresses[nu][0],
	:longitude => adresses[nu][2],
	:latitude => adresses[nu][1],
	:company_types => CompanyType.all.sample(2)
)

# (1..10).each do |n|
# 	Person.all.sample.companies << comp
# end

nu = Random.rand(5)
num = Random.rand(5)+1
dir = File.join(Rails.root, "public/samples")
item = "c" + num.to_s + ".jpg"
image = File.join(dir,item)
email=Forgery(:internet).email_address
title = "Pixology Studio"
link = "http://www.nextstepdirectory.com/graphic-web-design/pixology-studio"
description = "Pixology Studio is an independent design agency based is Beijing China, with a sales office and Amsterdam The Netherlands. A multi cultural team of highly committed and motivated individuals drives Pixology Studio. The team has extensive work experience within design, brand building and communication "
puts "adresses[nu][0]"
puts adresses[nu][0]
Company.create(
	:user_id => User.first.id,
	:name_en => title,
	:name_cn => "中文名字",
	:description => description,
	:website => link,
	:twitter => 'shanghaitech',
	:weibo => 'shanghaitech',
	:blog_feed => 'http://www.google.com',
	:image => File.open(image),
	:adress => adresses[nu][0],
	:longitude => adresses[nu][2],
	:latitude => adresses[nu][1],
	:company_types => CompanyType.all.sample(2)	
)

# (1..10).each do |n|
# 	Person.all.sample.companies << comp
# end

num = Random.rand(5)+1
dir = File.join(Rails.root, "public/samples")
item = "c" + num.to_s + ".jpg"
image = File.join(dir,item)
email=Forgery(:internet).email_address
title = "Thread Design Shanghai"
link = "http://www.nextstepdirectory.com/graphic-web-design/thread-design-shanghai-graphic-website-design-china"
description = "Thread Design, cross media design and branding. VI, graphic and web design specialists. A team with years of successful business experience in  in China. Quality and often complex websites design and built by our lovely in house designers and developers from top agency&#039;s and universities."
Company.create(
	:user_id => User.first.id,
	:name_en => title,
	:name_cn => "中文名字",
	:description => description,
	:website => link,
	:twitter => 'shanghaitech',
	:weibo => 'shanghaitech',
	:blog_feed => 'http://www.google.com',
	:image => File.open(image),
	:adress => adresses[nu][0],
	:longitude => adresses[nu][2],
	:latitude => adresses[nu][1],
	:company_types => CompanyType.all.sample(2)
)
comp.company_types << CompanyType.all.sample(2)

# (1..10).each do |n|
# 	Person.all.sample.companies << comp
# end

####################################
###### EVENTS
####################################

event_names =
	[
		"DesignIng Shanghai",
		"Barcamp Shanghai",
		"Startup Weekend",
		"Health 2.0",
		"Lean Startup Machine",
		"LEAN drinks",
		"Open coffee club ",
	]

Event.destroy_all
(1..4).each do |n|
	
	num = Random.rand(3)+1
	dir = File.join(Rails.root, "public/samples")
	item = "e" + num.to_s + ".png"
	image = File.join(dir,item)
	name=event_names[Random.rand(event_names.length)-1]
	description=Forgery(:lorem_ipsum).words(50)
	email=Forgery(:internet).email_address
	evt = Event.create(
		:user_id => User.first.id,
		:image => File.open(image),
		:name_en => name,
		:name_cn => "中文名字",
		:description => description,
		:email => email,
		:twitter => 'shanghaitech',
		:weibo => 'shanghaitech',
		:website => 'http://www.google.com',
		:blog_feed => 'http://www.google.com',
		)
		
		evt.event_types << EventType.all.sample(2)

		(1..5).each do |nnn|
			Person.all.sample.events << evt
		end

end


###################################
##### JOBS
###################################

puts "job creation"
Job.destroy_all

(1..3).each do |n|

	Job.create(
		:user_id => User.first,
		:title_en => "Webdesigner #{n}",
		:title_cn => "设计师 #{n}",
		:short_description => "This is a job description",
		:long_description => "This is a <strong>job description</strong><br/><br/><em>Line</em> break.with a is a long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long <strong>job description</strong><br/><br/><em>Line</em> break.",
		:website => "http://www.google.com",
		:email => "sacha@mail.com",
		:company => Company.all.sample(1).first,
		:job_types => JobType.all.sample(2)
		)

end