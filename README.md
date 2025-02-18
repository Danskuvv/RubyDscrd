# Ruby Discord

Ruby Discord is a Ruby on Rails web application inspired by Discord. It features user authentication, friend management, and a chat interface. **This is my first Rails practice project** and not a real world application.


[Project preview (video)](https://youtu.be/0qoVKAmPL5k)

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Test Suite](#running-the-test-suite)
- [Running the Application](#running-the-application)
- [Deployment](#deployment)
- [Additional Information](#additional-information)

## Prerequisites

- **Ruby** (built with 3.4.1)  
- **Rails** (built with 8.0.1)  
- A Unix-like environment is recommended (using WSL on Windows is supported)
- [Node.js](https://nodejs.org/) (if using Webpacker or Yarn for JavaScript packages)
- Git

## Installation

1. **Clone the repository:**

   bash:
   - git clone https://github.com/Danskuvv/RubyDscrd
   - cd ruby-discord

2. **Install dependencies:**

Make sure you have Ruby and Rails installed. Then install the required gems:

    - bundle install
    

3. **Database Setup**

Create the Database:

    rails db:create


Run Migrations:

    rails db:migrate


4. **Running the Application**

Start the Rails server with:
    - rails server
    - (or: rails s)

Then, navigate to http://localhost:3000 in your browser.


**Features:**

- Creating accounts with email and password, signing in to those accounts, signing out of those accounts.
- UI designed for desktop layouts
- Friend system:
    - Sending friend requests
    - Accepting or Rejecting friend requests
    - No duplicate friendships
- Message system:
    - Chatting with friends. 
    - Unique chat between each friend.
    -  *real time messaging * ( I tried to make it work with turbo streams or ActionCable but didn't find a working setup yet, so as a fallback solution the site uses polling to refresh incoming messages every few seconds.)


**Bugs:**

    - Logging in and logging out instantly might cause an error, but if for example a refresh is done after logging in then no errors.
    - Real time messaging doesnt work so an alternate solution is used.

**Features to be possible made in the future if time:**

    - Group messages/forums
    - Removing friends
    - Blocking users
    - Settings page
    - Usernames
