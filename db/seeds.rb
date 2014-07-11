lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
initial_text = [lorem, lorem, lorem].join("\n\n")

a = Documentation::Page.create(:title => 'Getting Started', :content => initial_text)
a.children.create(:title => 'Deploying from a repository', :content => initial_text)
a.children.create(:title => 'Deploying using SFTP', :content => initial_text)
a.children.create(:title => 'Deploying from a zip file', :content => initial_text)

b = Documentation::Page.create(:title => 'Reference Manual', :content => initial_text)
c = b.children.create(:title => 'The Viaduct Architecture', :permalink => 'architecture', :content => initial_text)

c.children.create(:title => 'HTTP Routing', :content => initial_text)
c.children.create(:title => 'Building your application', :content => initial_text)
c.children.create(:title => 'The Viaduct Stack', :content => initial_text)
c.children.create(:title => 'Logging', :content => initial_text)

d = b.children.create(:title => 'Features', :content => initial_text)
d.children.create(:title => 'Persistent Directories', :content => initial_text)
d.children.create(:title => 'Custom Domains', :content => initial_text)
d.children.create(:title => 'SSL', :content => initial_text)
d.children.create(:title => 'E-Mail Delivery', :content => initial_text)
d.children.create(:title => 'Webhooks', :content => initial_text)
d.children.create(:title => 'Maintenance Mode', :content => initial_text)
d.children.create(:title => 'Console', :content => initial_text)
d.children.create(:title => 'Tasks', :content => initial_text)
d.children.create(:title => 'Scheduled Tasks', :content => initial_text)

e = b.children.create(:title => 'Enterprise Databases', :content => initial_text)
e.children.create(:title => 'MySQL', :content => initial_text)
e.children.create(:title => 'PostgreSQL', :content => initial_text)
e.children.create(:title => 'MongoDB', :content => initial_text)
e.children.create(:title => 'Redis', :content => initial_text)
e.children.create(:title => 'Memcached', :content => initial_text)

f = b.children.create(:title => 'Templates', :content => initial_text)
f.children.create(:title => 'Ruby / Ruby on Rails', :content => initial_text)
f.children.create(:title => 'Node.js', :content => initial_text)
f.children.create(:title => 'PHP', :content => initial_text)

g = b.children.create(:title => 'Troubleshooting', :content => initial_text)

q = Documentation::Page.create(:title => 'The API Reference', :content => initial_text)
