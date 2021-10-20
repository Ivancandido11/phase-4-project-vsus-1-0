# VsUs on Rails

## VsUs is an app for online Settlers of Catan matchmaking. The app will feature a login page, leaderboards for users to show off their stats and a lobby list where users will be able to join and create new lobbies.

## Models, Associations, and Validations

### Users
  - Model
    - username (string)
    - password_digest (string)
    - profile_pic (string)
    - email (string)
    - points (integer)
    - inLobby (boolean)
    - vip (boolean)
    - banned (boolean)
    - admin (boolean)

  - Association
    - has_one :player_in_lobby

  - Validation
    - Validates that username, password, and email are present
    - Validates that username, and email are uniq and case insensitive

### Lobbies
  - Model
    - name (string)
    - avg_points (integer)
    - private (boolean)
    - is_full (boolean)

  - Association
    - has many players through player_in_lobbies

  - Validation
    - Validates presense of name
    - Validates that only 4 players can join the lobby

### Player_in_lobbies
  - Model
    - player_id (integer)
    - lobby_id (integer)

  - Association
    - belongs to a player and a lobby

  - Validation
    - Max four players
    - A player can only be in one lobby at a time

## Deliverables

### Homepage
- User not logged in
  - Will see a log in button [x]
  - Will see the 5 most recently created lobbies [x]
  - Will see the top 3 players [x]

- User logged in
  - Will see greeting and their current point count [x]
  - Will see the 5 most recently created lobbies [x]
  - Will see the top 3 players [x]

- Admin (Advanced Deliverable)
  - Will see a admin button on the nav [x]
  - Will see the 5 most recently created lobbies [x]
  - Will see the top 3 players [x]

### Leaderboards
- User not logged in
  - Will see the top 25 players [x]

- User / Admin logged in
  - Will see the top 25 players [x]
  - Will see their current point count [x]

### Lobbies
- User not logged in
  - Will be prompted to log in to see the page [x]

- User logged in
  - Will see a list of lobbies to join [x]
  - Will be able to join a lobby / or view a lobby if it is already full [x]
  - Will be able to create a new lobby []
    - When lobby is created / joined user will be redirected to game page []
  - Will see their current point count on the page []

- Admin (Advanced Deliverable)
  - Will not be able to join lobbies []
  - Will be able to delete lobbies []
  - Will be able to remove players from lobbies (Advanced x2) []

### Gamepage
- User not logged in
  - Will be prompted to log in to see the page []

- User logged in
  - Whichever user created the lobby will be the Host []
  - Host will be able to remove players (Advanced Deliverable) []
  - Users will see the game board and players that are in the game []
  - Once the lobby is full, game can be completed []

- Admin (Advanced Deliverable)
  - Will be able to view a game []
  - Will be able to remove players []
  - Will be able to end the game, no points being awarded (Advanced x2) []

### User Homepage
- User not logged in
  - Will be prompted to log in to see the page []

- User logged in
  - Will see current users information []
  - Will be able to update information []
  - Will not be able to see other users information []

### Admin Homepage (Advanced Deliverable)
- Users 
  - Will not be able to see this page []

- Admin
  - Will be able to turn off lobby creation []
  - Will be able to turn off lobby joining []
  - Will be able to access lobby list and delete / create lobbies
    - Create private lobbies for VIPs []
  - Will be able to access player list
    - Can ban players []
    - Can change players point counts []
    - Can assign VIPs []

## All The Advanced Deliverables

### Admin Homepage (Advanced Deliverable)
- Users 
  - Will not be able to see this page

- Admin
  - Will be able to turn off lobby creation
  - Will be able to turn off lobby joining
  - Will be able to access lobby list and delete / create lobbies
    - Create private lobbies for VIPs
  - Will be able to access player list
    - Can ban players
    - Can change players point counts
    - Can assign VIPs

### Gamepage
- User logged in
  - Host will be able to remove players (Advanced Deliverable)

- Admin (Advanced Deliverable)
  - Will be able to view a game
  - Will be able to remove players
  - Will be able to end the game, no points being awarded (Advanced x2)

### Lobbies
- Admin (Advanced Deliverable)
  - Will not be able to join lobbies
  - Will be able to delete lobbies
  - Will be able to remove players from lobbies (Advanced x2)

### Homepage
- Admin (Advanced Deliverable)
  - Will see a admin button on the nav
  - Will see the 5 most recently created lobbies
  - Will see the top 3 players