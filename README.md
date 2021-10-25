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

[Current Feature List](feature-list.md)

## Getting Started
- VsUs is currently running on Ruby version 2.7.3 and Rails version 6.1.4.1
- Clone this repo
- Bundle then migrate
- Start the rails server