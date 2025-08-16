# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal assistant directory focused on workflows around logging daily software engineering work, tracking performance metrics, integrating feedback from mentorship, and creating documentation for all of the same.

## Common Commands

### Development Tools

### Utility Scripts

### Editor Configuration

- **Smart Editor Selection**: `./bin/edit [file]`
  - Intelligently selects the best available editor
  - Falls back gracefully based on environment

## Architecture

### Structure

```
/
├── bin/                    # Executable scripts and utilities
├── assistant/              # AI assistant configurations
│   └── CLAUDE.md          # Assistant-specific documentation
├── [growth]/               # Performance tracking and review materials (configurable)
│   ├── documents/          # Screenshots, feedback, evidence
│   ├── metrics/            # Performance tracking JSON data
│   ├── templates/          # Review and assessment templates
│   └── annual-reviews/     # Historical performance reviews
├── [personal]/             # Personal management data (configurable)
│   └── friends.json       # Contact tracking
├── [logs]/                 # Work logging and project tracking (configurable)
│   └── work-log.json      # Daily work logs and project data
├── CLAUDE.md              # Primary Claude configuration
├── README.md              # Setup instructions
└── useful-aliases.zsh     # Shell aliases and shortcuts
```

### Key Components

- **Shell Scripts**: Collection of development and system management utilities in `bin/`

### Assistant Integration

The `assistant/CLAUDE.md` contains specific guidance for AI assistants working with:

- Date handling patterns and bash date commands
- Logging daily work and handling reminders
- Tracking performance evidence, metrics and feedback as well as self-reflection
- Personal contact management JSON schema

## Quick Commands

### Work Logging Shortcuts

- **"log work"** - Create/update today's work log entry with tasks and tickets
  - Shows yesterday's tomorrow_reminders first
  - Then creates/updates today's work log

**CRITICAL: When user says "log work", "work logging", or similar work logging requests, ALWAYS provide this exact crisp summary first:**

"I can help you log today's work and capture performance evidence:

**Work Logging:**

- Create/update daily log with tasks, tickets, blockers
- Link Jira tickets and Confluence pages
- Set mood/energy and tomorrow reminders

**Performance Capture:**

- Process screenshots (drag & drop) - I'll name, categorize, and file them
- Identify significant achievements for performance tracking
- Update performance metrics JSON with quantified impact
- Link evidence to quarterly goals and review preparation

**Integrations:**

- Search/update Jira tickets and add comments
- Create/update Confluence documentation
- Cross-reference with ongoing projects and goals

What would you like to start with?"

**This summary must be provided BEFORE doing any work logging activities.**

- **"standup"** - Quick standup format: yesterday's work, today's plan, blockers
- **"eod"** - End of day: summarize work, set tomorrow reminders, mood check
- **"check reminders"** - Show yesterday's tomorrow_reminders and overdue items

### Work Logging Process

**CRITICAL: ALWAYS get the actual system date first before any work logging tasks:**

```bash
# Get today's date
date +%Y-%m-%d

# Get yesterday's date (macOS)
date -v-1d +%Y-%m-%d

# Get yesterday's date (Linux)
date -d "yesterday" +%Y-%m-%d
```

When creating today's work log entry:

1. **FIRST: Run `date +%Y-%m-%d` to get today's actual date**
2. **SECOND: Calculate yesterday's date to find correct reminders**
3. **Check for yesterday's log entry and tomorrow_reminders**
   - If no log exists for yesterday, mention this and ask if intentional
   - Keep looking back through previous days until finding the most recent log with reminders
   - This handles weekends/gaps where no work was logged
4. **Ask which reminders were completed today**
5. **Carry forward uncompleted reminders to today's tomorrow_reminders**
6. **Add any new reminders for tomorrow**
7. **Never assume or guess reminder status - always ask**

### Jira/Confluence Shortcuts

- **"my tickets"** - Search for tickets assigned to me that are in progress
- **"create doc"** - Create new Confluence page with work context
  - Asks for document title and purpose
  - Asks which Confluence space to publish in

### Personal Management

- **"contacts"** - Show friends who need contact or update contact log
