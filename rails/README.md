# 🌻 Dandelion 2 - Rails API

A modern Rails app for the new multi-platform Dandelion project, featuring web, iOS, and Android apps.

## 🚀 Quick Start

### Prerequisites
- Ruby 3.4.4
- MongoDB (running on localhost:27017)
- Bundler gem

### Setup
1. **Install dependencies:**
   ```bash
   bundle install
   ```

2. **Start MongoDB** (if not running):
   ```bash
   # macOS with Homebrew:
   brew services start mongodb-community
   
   # Or manually:
   mongod --config /opt/homebrew/etc/mongod.conf
   ```

3. **Start the Rails server:**
   ```bash
   bin/rails server
   ```

4. **Visit the app:**
   Open http://localhost:3000 in your browser

## 📱 Features

### MVP - Event Management
- ✅ **Create Events**: Add new events with name, description, location, and timing
- ✅ **View Events**: Browse all events in a clean, responsive interface  
- ✅ **Edit Events**: Update event details
- ✅ **Delete Events**: Remove events with confirmation

### Architecture
- **Models**: Shared with original Dandelion app via symlink (`app/models -> ../../../dandelion/models`)
- **Database**: MongoDB with Mongoid ODM
- **Frontend**: Bootstrap 5 + Turbo + Stimulus
- **Styling**: Custom Dandelion-themed CSS with sunflower colors 🌻

## 🛠️ Development

### Testing the Event Model
```bash
# Start Rails console
bin/rails console

# Test Event model
Event.count
Event.create(name: "Test Event", description: "A test event", location: "Online")
```

### Project Structure
```
dandelion2/rails/
├── app/
│   ├── controllers/events_controller.rb  # CRUD for events
│   ├── models/ -> ../../../dandelion/models/  # Symlinked models
│   └── views/events/  # Event templates
├── config/
│   ├── mongoid.yml  # MongoDB configuration
│   └── routes.rb    # Routes for events
└── README.md
```

## 🎯 Next Steps

1. **Mobile Apps**: iOS and Android apps will consume this Rails API
2. **Authentication**: Add user authentication and authorization
3. **More Models**: Integrate additional models from the original Dandelion app
4. **API Endpoints**: Add JSON API endpoints for mobile apps
5. **Real-time Features**: WebSocket support for live updates

## 🌻 About Dandelion

This is the new multi-platform version of Dandelion, expanding from the original web-only application to include native mobile apps while maintaining compatibility with existing data and models.
