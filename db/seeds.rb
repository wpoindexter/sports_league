sport = Sport.create name: 'football'
season = Season.create start_date: Chronic.parse('August 1, 2016'), end_date: Chronic.parse('December 31, 2016'), name: 'Fall 2016', sport: sport
address = Address.create address1: '1231 Thomas Daniel Way', city: 'Lawrenceville', state: 'GA', postal_code: '30045'
parent = Parent.create first_name: 'William', last_name: 'Poindexter', email: 'wryanp@gmail.com', phone: '6786419168'
user = User.create email: 'wryanp@gmail.com', password: '12345678', password_confirmation: '12345678'
user.confirm!
UserRole.create user: user, parent: parent
player1 = Player.create first_name: 'William', middle_name: 'Ryan', last_name: 'Poindexter', birth_date: Chronic.parse('July 18, 2006'), weight: '90', grade: '4', email: 'willryanp@gmail.com', phone: '6786419168', address: address
player1.parents << parent && player1.save
player2 = Player.create first_name: 'Maxwell', middle_name: 'Justus', last_name: 'Poindexter', birth_date: Chronic.parse('July 18, 2006'), weight: '', grade: 'P', email: '', phone: '', address: address
player2.parents << parent && player2.save
registration = Registration.create active: true, paid: true, player: player1, season: season
coach1 = Coach.create first_name: 'Perri', last_name: 'Johnson', status: 'ACTIVE', email: 'perri@gmail.com', phone: '3145558888', address: Address.new(address1: '123 Main St.', city: 'Florissant', state: 'MO', postal_code: '63033')
coach2 = Coach.create first_name: 'Frank', last_name: 'Johnson', status: 'ACTIVE', email: 'frank@gmail.com', phone: '3145558888', address: Address.new(address1: '124 Main St.', city: 'Florissant', state: 'MO', postal_code: '63033')
team = Team.create grade1: 3, grade2: 4, name: 'Johnson', season: season
TeamCoach.create head_coach: true, coach: coach1, team: team
TeamCoach.create head_coach: false, coach: coach2, team: team, role: 'Defensive Coordinator'
TeamManager.create first_name: 'Ikwo', last_name: 'Poindexter', email: 'inpoindexter@gmail.com', phone: '8887778888', team: team
roster_spot = RosterSpot.create player: player1, team: team
position = Position.create name: 'Linebacker', short_name: 'LB'
RosterPosition.create roster_spot: roster_spot, position: position, rank: 1
admin = User.create email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678'
admin.confirm!
UserRole.create user: admin, admin: true
