# VsUs on Rails

## Description
- VsUs is an app for online Settlers of Catan matchmaking. The app will feature a login page, leaderboards for users to show off their stats and a lobby list where users will be able to join and create new lobbies. Currently a user can login/create a new account, there is authentication using bcrypt gem. I chose to use bcrypt over devise for the ease of setup. Once a user is logged in they can then join or create a new lobby. A user can only be in one lobby at a time, so once they join a lobby they have to wait until the lobby is full (4 users) then an option to end the game will appear and once the game has ended the lobby will be deleted and those users can then join other lobbies. On game end the app assigns a winner and a second place user and they are then awarded points (10, 5). Users can edit they're profile pages, they can view the leaderboards, and it the homepage they can view the top 3 users according to points and the last 5 lobbies created. 

## Future Features
- One huge goal for the future is to eventually include the actual game into the app. 
- Admin page 
  - Admins will be able to ban users or make them vips 
  - They will be able to create private lobbies 
  - Edit user point counts
- Stats page 
  - It will keep track of wins, second places, losses and game played 
  - Eventually when the actual game is implemented the stats page will include other stats
    - Lifetime point count
    - Wins in different starting positions
    - Rolls
    - Cards played
    - Cards earned etc.
- Lobby Host (Right now the user who creates a lobby is assigned as the host)
  - Kick users from lobby
  - Assign another user as host
  - Invite users

## Contents
  - Models, Associations and Validations
  - Deliverables
  - Advanced Deliverables

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
  - Will be able to create a new lobby [x]
    - When lobby is created / joined user will be redirected to game page [x]
  - Will see their current point count on the page [x]

- Admin (Advanced Deliverable)
  - Will not be able to join lobbies []
  - Will be able to delete lobbies []
  - Will be able to remove players from lobbies (Advanced x2) []

### Gamepage
- User not logged in
  - Will be prompted to log in to see the page [x]

- User logged in
  - Whichever user created the lobby will be the Host [x]
  - Host will be able to remove players (Advanced Deliverable) []
  - Users will see the game board and players that are in the game [x]
  - Once the lobby is full, game can be completed [x]

- Admin (Advanced Deliverable)
  - Will be able to view a game []
  - Will be able to remove players []
  - Will be able to end the game, no points being awarded (Advanced x2) []

### User Homepage
- User not logged in
  - Will be prompted to log in to see the page [x]

- User logged in
  - Will see current users information [x]
  - Will be able to update information [x]
  - Will not be able to see other users information [x]

### Admin Homepage (Advanced Deliverable)
- Users 
  - Will not be able to see this page [x]

- Admin
  - Will be able to turn off lobby creation []
  - Will be able to turn off lobby joining []
  - Will be able to access lobby list and delete / create lobbies
    - Create private lobbies for VIPs []
  - Will be able to access player list
    - Can ban players []
    - Can change players point counts []
    - Can assign VIPs []

### Stats Page (Advanced Deliverable)
- All
  - Will display for all users who have played one game
    - Games played
    - Wins
    - 2nd place
    - losses

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