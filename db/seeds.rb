User.create!([
  {email: "beyrerdn@gmail.com", encrypted_password: "$2a$10$L7oa3lLUbj/vt5e1P64MKetMMF1c9CBgGQglJDS1RDnOTGQJP6g3C", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-08-03 00:29:05", last_sign_in_at: "2015-08-03 00:29:05", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {email: "christopherwalken@gmail.com", encrypted_password: "$2a$10$TWFA6ESIhLOVZ7iz9Fh2uerkWWz3xQcA7SIe3HqMeoacw0w4JWsfu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-08-03 00:38:58", last_sign_in_at: "2015-08-03 00:38:58", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
Post.create!([
  {title: "TIL that the fire hydrant is believed to have been invented by an engineer named Frederick Graff, but this can't be verified because the patent was destroyed in a fire at the patent office in 1836.", url: "https://en.wikipedia.org/wiki/Fire_hydrant", summary: nil, user_id: 1, subreddit_id: 1},
  {title: "TIL that after Tupac was cremated, his ashes were mixed with marijuana and smoked by members of his hip-hop group, Outlawz.", url: "http://www.nydailynews.com/entertainment/music-arts/young-outlawz-admit-smoking-tupac-shakur-ashes-mixed-marijuana-1996-article-1.950906", summary: nil, user_id: 1, subreddit_id: 1},
  {title: "This year, I went to comic con as \"Drunk Uncle Ben\". The goal: pass out and die in front of as many spidermen as possible.", url: "http://imgur.com/US93Vea", summary: nil, user_id: 1, subreddit_id: 2},
  {title: "Not only men!", url: "http://imgur.com/Cxpumj7", summary: nil, user_id: 2, subreddit_id: 2},
  {title: "What happens when a joey needs a pouch but does not have a mother", url: "http://i.imgur.com/B09RmsK.gifv", summary: nil, user_id: 2, subreddit_id: 4},
  {title: "Whack-a-worker", url: "https://i.imgur.com/4PbyQcz.gif", summary: nil, user_id: 2, subreddit_id: 4},
  {title: "Was that pool always there!?", url: "http://i.imgur.com/AWy5UaL.gifv", summary: nil, user_id: 2, subreddit_id: 3},
  {title: "Bath time", url: "http://i.imgur.com/ANasNyL.gifv", summary: nil, user_id: 2, subreddit_id: 3},
  {title: "Who's a pretty girl?!?! ... Aw shucks, is it me?", url: "http://i.imgur.com/6CtgXJP.jpg", summary: nil, user_id: 2, subreddit_id: 3}
])
Subreddit.create!([
  {title: "todayilearned"},
  {title: "funny"},
  {title: "aww"},
  {title: "gif"}
])
Vote.create!([
  {user_id: nil, post_id: 2, up: true},
  {user_id: nil, post_id: 2, up: true},
  {user_id: nil, post_id: 3, up: true},
  {user_id: nil, post_id: 5, up: true},
  {user_id: nil, post_id: 7, up: true},
  {user_id: nil, post_id: 8, up: true},
  {user_id: nil, post_id: 3, up: true},
  {user_id: nil, post_id: 4, up: true},
  {user_id: nil, post_id: 3, up: true}
])
