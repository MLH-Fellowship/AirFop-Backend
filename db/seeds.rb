# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'John', last_name: 'Doe', email: 'airforce@us.gov', password: 'password', is_admin: false)
User.create(first_name: 'Jane', last_name: 'Stark', email: 'airforce1@us.gov', password: 'password', is_admin: true)
User.create(first_name: 'Johnny', last_name: 'Timmy', email: 'airforce2@us.gov', password: 'password', is_admin: false)
User.create(first_name: 'Jacob', last_name: 'Johnson', email: 'airforce3@us.gov', password: 'password', is_admin: true)
User.create(first_name: 'Joan', last_name: 'Dark', email: 'airforce4@us.gov', password: 'password', is_admin: false)

Project.create(project_num: 1, project_name: 'Project One',
               phase: 'Phase One', award_date: Date.today, pop: 'today', customer: 'Batman', contractor: 'Gotham',
               pm: 'Batgirl', status: 'Green', status_comment: 'Jim Gordon', funding_source: 'Gotham Treasurey')

Project.create(project_num: 2, project_name: 'Project Two',
               phase: 'Phase Two', award_date: Date.today, pop: 'today', customer: 'Superman', contractor: 'Earth',
               pm: 'Louis Lane', status: 'Red', status_comment: 'Maybe guy in glasses?', funding_source: 'US Treasury')

Project.create(project_num: 3, project_name: 'Project Three',
               phase: 'Phase Three', award_date: Date.today, pop: 'today', customer: 'Captian America',
               contractor: 'Shield', pm: 'Black Widow', status: 'Red', status_comment: 'First Avenger',
               funding_source: 'Nick Fury')

Project.create(project_num: 4, project_name: 'Project Four',
               phase: 'Phase One', award_date: Date.today, pop: 'today', customer: 'Iron Man',
               contractor: 'Depeartment of Defense', pm: 'Pepper Potts', status: 'Yellow', status_comment: '',
               funding_source: 'Stark Industries')

Project.create(project_num: 5, project_name: 'Project Five',
               phase: 'Phase Three', award_date: Date.today, pop: 'today', customer: 'Spiderman', contractor: 'Zendaya',
               pm: 'Iron Man', status: 'Yellow', status_comment: 'Friendly Neighborhood',
               funding_source: 'Stark Industries')

