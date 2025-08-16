# Claude Code Assistant Setup

Personal productivity system for Claude Code with work logging, contact management, and performance tracking.

## What's Included

### Claude Assistant System

- **`assistant/CLAUDE.md`** - Complete assistant documentation with Atlassian integration
- **`CLAUDE.md`** - Repository overview and architecture
- **Work logging** framework with Jira/Confluence integration (configurable directory)
- **Contact management** system (configurable directory)
- **Performance tracking** with screenshot evidence capture and metrics tracking (configurable directory)

### Useful Scripts

Scripts are available in the repository `bin/` directory.

- **`setup-assistant`** - Interactive setup script for configuring your personal directories
- **`edit`** - Smart editor launcher with intelligent fallbacks

### Optional Extras

- **`useful-aliases.zsh`** - Curated shell aliases you can add to your `.zshrc`

## Quick Commands

When using Claude Code in this directory, you can use these shortcut phrases:

### Work Logging

- **"log work"** - Create/update today's work log with tasks and tickets
- **"standup"** - Quick standup format: yesterday's work, today's plan, blockers
- **"eod"** - End of day summary with mood check and tomorrow reminders
- **"check reminders"** - Show yesterday's reminders and overdue items

### Jira/Confluence

- **"my tickets"** - Search for tickets assigned to you in progress
- **"create doc"** - Create new Confluence page with work context

### Personal Management

- **"contacts"** - Show friends who need contact or update contact log

## Setup

1. Fork this repository to your own GitHub account, then clone your fork
2. Run the setup script: `./bin/setup-assistant`
   - Choose names for your directories (defaults: `logs/`, `growth/`, `social/`)
   - Creates initial data files and templates
   - Automatically configures .gitignore to keep your data private
3. **Configure Atlassian Integration** (optional):
   - The assistant uses an Atlassian MCP for Jira/Confluence integration
   - Set up the MCP server with your Atlassian credentials, or
   - Replace references in `assistant/CLAUDE.md` with your preferred project management tools
4. Add `bin/` to your PATH if desired: `export PATH="$(pwd)/bin:$PATH"`
5. Source `useful-aliases.zsh` in your `.zshrc` if you want the aliases
6. Use Claude Code in this directory - it will automatically load the assistant configuration

## Directory Configuration

The assistant uses `.assistant-config.json` to know which directories you're using:

```json
{
  "directories": {
    "work": "logs", // Your work logging directory
    "performance": "growth", // Your performance tracking directory
    "personal": "social" // Your personal/social directory
  }
}
```

- **New users:** The setup script creates this config automatically
- **Existing users:** Create the config manually with your current directory names
- **Customization:** Edit the config anytime to rename directories

## Privacy

All personal data directories and configuration files created by the setup script and during normal use are automatically gitignored and stay on your local machine only.
