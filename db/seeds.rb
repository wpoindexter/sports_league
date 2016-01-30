sport = Sport.create name: 'football'
season = Season.create start: Chronic.parse('August 1, 2016'), end: Chronic.parse('December 31, 2016'), name: 'Fall 2016'
address = Address.create address1: '1231 Thomas Daniel Way', city: 'Lawrenceville', state: 'GA', postal_code: '30045'
player1 = Player.create first_name: 'William', middle_name: 'Ryan', last_name: 'Poindexter', birth_date: Chronic.parse('July 18, 2006'), weight: '90', grade: '4', email: 'willryanp@gmail.com', phone: '6786419168', address: address
player2 = Player.create first_name: 'Maxwell', middle_name: 'Justus', last_name: 'Poindexter', birth_date: Chronic.parse('July 18, 2006'), weight: '', grade: 'P', email: '', phone: '', address: address
parent = Parent.create first_name: 'William', last_name: 'Poindexter', email: 'wryanp@gmail.com', phone: '6786419168'
parent.players << [player1, player2]
parent.save
registration = Registration.create status: 'ACTIVE', paid: true, player: player1, sport: sport, season: season
coach = Coach.create first_name: 'Perri', last_name: 'Johnson', status: 'ACTIVE', email: 'perri@gmail.com', phone: '3145558888', address: Address.new(address1: '123 Main St.', city: 'Florissant', state: 'MO', postal_code: '63033')
team = Team.create grade1: 3, grade2: 4, name: 'Johnson', sport: sport, season: season
TeamCoach.create head_coach: true, coach: coach, team: team
roster_spot = RosterSpot.create player: player1, team: team
position = Position.create name: 'Linebacker'
RosterPosition.create roster_spot: roster_spot, position: position
