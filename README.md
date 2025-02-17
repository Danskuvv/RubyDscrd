# Ruby Discord

Ruby Discord is a Ruby on Rails web application inspired by Discord. It features user authentication, friend management, and a chat interface. **This is a practice project** and not a real world application.

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