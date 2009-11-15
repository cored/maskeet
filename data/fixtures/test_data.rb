User.all.destroy!
Question.all.destroy!
Interest.all.destroy!

User.fix(:anonymous) {{
  :login => 'anonymous',
  :first_name => 'Anonymous',
  :last_name => 'Coward',
  :password => password = 'anonymous',
  :password_confirmation => password,
}}

User.fix(:cored) {{
  :login =>  'cored',
  :first_name =>  'Rafael',
  :last_name =>  'George',
  :password => password = 'cored',
  :password_confirmation => password,
}}

User.fix(:molly) {{
  :login => 'molly',
  :first_name => 'Molly',
  :last_name  => 'Grey',
  :password => password = 'molly',
  :password_confirmation => password,
}}

Question.fix(:question1) {{
  :title  => 'What shall i do tonight with my girlfriend?',
  :user   => User.pick(:cored),
  :body   => "We shall meet in front of the Dunkin'Donuts before dinner, and i haven't the slightest idea of what i can do with her. She's not interested in programming, space opera movies nor insect She's kinda cute, so I really need to find something that will keep her to my side for another evening",
}}

Question.fix(:question2) {{
  :title  => 'What can i offer to my step mother?',
  :body   => "My stepmother has everything a stepmother is usually offered (watch, vacuum cleaner, earrings, del.icio.us account). Her birthday comes next week, I am broke, and I know that  if I don't offer her something sweet, my girlfriend won't look at me in the eyes for another month.",
  :user   => User.pick(:molly),
}}

Question.fix(:question3) {{
  :title => 'How can i generate trafic to my blog?',
  :body  => 'I have a very swell blog that talks about my class and mates and pets and favorite movies.',
  :user  => User.pick(:anonymous),
}}

Interest.fix(:interest1) {{
  :user => User.pick(:cored),
  :question => Question.pick(:question1),
}}

Interest.fix(:interest2) {{
  :user => User.pick(:cored),
  :question => Question.pick(:question2),
}}

Interest.fix(:interest3) {{
  :user => User.pick(:molly),
  :question => Question.pick(:question1),
}}

Interest.fix(:interest4) {{
  :user => User.pick(:molly),
  :question => Question.pick(:question2),
}}

# Database population
User.gen(:anonymous)
User.gen(:cored)
User.gen(:molly)

Question.gen(:question1)
Question.gen(:question2)
Question.gen(:question3)

Interest.gen(:interest1)
Interest.gen(:interest2)
Interest.gen(:interest3)
Interest.gen(:interest4)

