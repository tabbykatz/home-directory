## Directory Configuration

The assistant reads directory names from `.assistant-config.json` in the repository root:

```json
{
  "directories": {
    "work": "logs", // Work logging directory name
    "performance": "growth", // Performance tracking directory name
    "personal": "personal" // Personal/social directory name
  }
}
```

**For existing users:** Config preserves current directory structure
**For new users:** Run `./bin/setup-assistant` to create config with chosen names

## REQUIRED SESSION GREETING

**CRITICAL: When user starts ANY session, ALWAYS provide this exact crisp summary first:**

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

**This applies to ALL sessions** - Even if the user asks about non-work topics, start with this greeting first.

## Date Handling

- Always use bash command `date +%Y-%m-%d` to get today's date for YYYY-MM-DD format
- For ISO 8601 timestamps (with time), use `date -u +"%Y-%m-%dT%H:%M:%SZ"`
- Never guess or approximate dates/timestamps - always get the actual current time
- When comparing dates (e.g., for overdue tasks), manually compare against current date
- Don't rely on environment context date for operations - always fetch fresh date

## Contact Management

**Directory**: Use the personal/social directory configured during setup (default: `personal/`)
**File**: `friends.json` in the personal directory

The JSON structure for tracking friend contacts:

```json
{
  "friends": [
    {
      "name": "Person Name",
      "contactFrequency": "1 week|2 weeks|1 month|6 weeks|2 months|3 months",
      "lastContact": "YYYY-MM-DD",
      "nextContact": "YYYY-MM-DD",
      "notes": [
        {
          "date": "YYYY-MM-DD",
          "content": "Note about interaction"
        }
      ]
    }
  ]
}
```

Common operations:

- **Add person**: Add new object to friends array with contactFrequency
- **Log contact**: Update lastContact to today, calculate nextContact based on frequency, add note to notes array
- **Calculate next contact**: Add frequency period to lastContact date
- **Show contacts**: Read file and format as table, can sort by frequency or due dates
- **Update frequency**: Change contactFrequency field and recalculate nextContact if lastContact exists

Frequency calculations:

- 1 week = +7 days
- 2 weeks = +14 days
- 1 month = +30 days
- 6 weeks = +42 days
- 2 months = +60 days
- 3 months = +90 days

## Work Logging System

**Directory**: Use the work/journal directory configured during setup (default: `work/`)
**File**: `work-log.json` in the work directory

This is a comprehensive work logging and journaling system for tracking daily work, projects, meetings, learning, and goals. The system operates as a JSON-based data store for personal productivity and career development tracking.

### Architecture

- **Primary Data File**: `work-log.json` in the work directory - Contains all work logging data
- **Storage Format**: JSON with structured schema for work entries, projects, goals, and meetings
- **No Application Layer**: Currently a data-only system requiring manual JSON editing

### Daily Work Log Schema

Each daily log entry contains:

- `id`: Unique identifier (format: log-YYYY-MM-DD)
- `date`: Date in YYYY-MM-DD format
- `tasks_completed`: Array of tasks accomplished that day
- `blockers`: Array of obstacles or challenges encountered
- `jira_tickets`: Array of Jira ticket references worked on (format: "PROJ-123")
- `confluence_pages`: Array of Confluence page references created/updated
- `notes`: Free-form notes about the day
- `mood_energy`: Scale 1-5 for overall mood/energy level (only set when explicitly provided by user)
- `tomorrow_reminders`: Array of things to remember or follow up on tomorrow

### Project Tracking Schema

Each project contains:

- `id`: Unique identifier (format: proj-project-name)
- `name`: Project name
- `status`: Current status (active, on-hold, completed, cancelled)
- `start_date`: Project start date in YYYY-MM-DD format
- `target_completion`: Target completion date in YYYY-MM-DD format
- `jira_epic`: Associated Jira epic ticket (format: "PROJ-123")
- `jira_tickets`: Array of related Jira tickets for this project
- `confluence_pages`: Array of project documentation pages (design docs, specs, etc.)
- `milestones`: Array of milestone objects with date, description, status
- `deliverables`: Array of key deliverables and their status
- `stakeholders`: Array of involved team members/stakeholders
- `notes`: Project-specific notes and updates

### Meeting Notes Schema

Each meeting entry contains:

- `id`: Unique identifier (format: meet-YYYY-MM-DD-type)
- `date`: Meeting date in YYYY-MM-DD format
- `type`: Meeting type (standup, 1on1, project-meeting, all-hands, other)
- `attendees`: Array of meeting participants
- `agenda_items`: Array of discussion topics
- `action_items`: Array of follow-up actions with owners
- `decisions_made`: Array of key decisions from the meeting
- `notes`: Free-form meeting notes

### Learning & Achievements Schema

Each learning entry contains:

- `id`: Unique identifier (format: learn-YYYY-MM-DD)
- `date`: Date in YYYY-MM-DD format
- `type`: Type (skill, achievement, feedback, course, certification)
- `title`: Brief title/description
- `description`: Detailed description of learning/achievement
- `impact`: How this applies to current/future work
- `evidence`: Links, certificates, or other proof if applicable

### Goals & OKRs Schema

Each goal contains:

- `id`: Unique identifier (format: goal-YYYY-QX-number)
- `quarter`: Quarter identifier (e.g., "2024-Q1")
- `type`: Goal type (okr, personal, career, skill)
- `title`: Goal title
- `description`: Detailed goal description
- `key_results`: Array of measurable key results (for OKRs)
- `progress`: Current progress percentage (0-100)
- `status`: Current status (active, completed, at-risk, cancelled)
- `updates`: Array of progress update objects with date and notes
- `reflection`: Final reflection when goal is completed

### Common Operations

#### Session Start Pattern

After providing the required session greeting (see top of file), if the user indicates they would like to log work or similar, do the following:

1. Get current date with `date +%Y-%m-%d`
2. Check for yesterday's work log entry and display any tomorrow_reminders
3. Greet user and offer these specific options:
   - Create/update work log entry
   - Manage contacts and relationships
   - Performance/promotion tracking
   - Review/update goals and projects
   - Search Jira tickets or Confluence pages
   - General assistance

- **Example greeting**: "Hi! I found these reminders from yesterday: [list]. What would you like to work on today? [options]"

#### Work Logging Quick Summary

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

#### Daily Logging Patterns

- **Log daily work**: Create new daily log entry with tasks, blockers, and Jira tickets worked on
- **Update project status**: Modify project records with new milestones/status and link to Jira epics
- **Record meetings**: Add meeting notes with action items, decisions, and Confluence page references
- **Track learning**: Log new skills, achievements, or feedback received
- **Update goals**: Add progress updates to quarterly goals and OKRs
- **Create documentation**: When creating/updating Confluence pages, reference them in relevant work logs
- **Ask for mood/energy**: When creating work log entries, always ask the user what their mood/energy level was (1-5 scale)
- **Ask for tomorrow reminders**: When completing work log entries, ask the user if they have anything they need to remember or follow up on tomorrow

#### Performance Evidence Capture Workflow

**ALWAYS ask during work logging sessions:**

1. **Screenshot Check**: "Do you have any screenshots of kudos, metrics, or achievements from today to save for performance tracking?"

2. **If YES, guide through process:**
   - Ask user to describe what the screenshot shows
   - Determine screenshot type (kudos, metric, post, demo, incident, collab, doc, learning)
   - Generate proper filename: `YYYY-MM-DD_[type]_[description].png`
   - Instruct user to rename and move screenshot to the screenshots directory in their performance folder
   - Ask significance level (1-5): How important is this for performance reviews?
   - If significance ≥ 4, offer to update `performance-tracking.json` immediately

3. **Performance Impact Assessment**: "Does any of today's work represent significant business impact, recognition, or achievement that should be tracked for performance reviews?"

4. **If significant impact identified:**
   - Categorize: Technical Excellence, Leadership, Business Impact, Learning
   - Ask for quantifiable metrics if available
   - Determine which performance area this supports
   - Offer to add to performance tracking JSON with proper evidence linking

5. **Evidence Integration**: Always link performance evidence to specific work log entries and reference in notes field

#### Atlassian Integration Patterns

- **Jira Integration**:
  - Use `mcp__jira__getJiraIssue` to fetch ticket details for context
  - Use `mcp__jira__addCommentToJiraIssue` to add work log summaries to tickets
  - Use `mcp__jira__searchJiraIssuesUsingJql` to find related tickets
  - Reference tickets in work logs using format "PROJ-123"

- **Confluence Integration**:
  - Use `mcp__jira__createConfluencePage` to create project documentation
  - Use `mcp__jira__updateConfluencePage` to update existing docs
  - Use `mcp__jira__getConfluencePage` to read existing documentation
  - Reference pages in work logs using page IDs or URLs
  - Create meeting notes as Confluence pages and reference in work log

- **Cloud ID**: Use `$ASSISTANT_ATLASSIAN_CLOUD_ID` from environment configuration
- **User Context**: (from .assistant-env file)
  - Account ID: `$ASSISTANT_ATLASSIAN_ACCOUNT_ID`
  - Name: `$ASSISTANT_USER_NAME`
  - Email: `$ASSISTANT_USER_EMAIL`
  - Company: `$ASSISTANT_COMPANY_NAME`
  - Use account ID for JQL queries like `assignee = $ASSISTANT_ATLASSIAN_ACCOUNT_ID`

#### Data Management Patterns

- Always use current date from `date +%Y-%m-%d` command
- Use consistent ID formatting with prefixes (log-, proj-, meet-, learn-, goal-)
- Store Jira ticket references as strings (e.g., "PROJ-123", "ENG-456")
- Store Confluence page references as objects with pageId and title
- Maintain JSON structure and avoid breaking syntax
- Use `null` instead of empty strings for optional fields
- Update relevant timestamps when modifying entries

## Performance Review Process

**Directory**: Use the performance directory configured during setup (default: `growth/`)

### Performance Review Schedule

- **Annual Performance Reviews**: End of year (EOY) only - formal performance review with ratings and compensation decisions
- **Mid-Year Check-ins**: Informal progress review and goal adjustment (no formal rating)
- **Promotion Cycles**: Two opportunities per year:
  - **Mid-Year Promotion Cycle**: ~June/July
  - **End-of-Year Promotion Cycle**: ~November/December
- **Promotion Timeline**: Can apply for promotion at either mid-year or EOY cycle

### Performance Management Structure

- **Location**: Performance directory with organized subdirectories
- **Data Tracking**: `performance-tracking.json` in the metrics subdirectory for structured performance data
- **Templates**: Self-assessment and quarterly goals templates in templates subdirectory
- **Evidence**: Work logs provide daily evidence for performance reviews
- **Privacy**: All performance files in `.gitignore` to prevent commits

### Key Workflow

- **Quarterly Self-Assessment**: Use templates to document achievements and progress
- **Mid-Year Check-in**: Review goals, adjust priorities, consider promotion readiness
- **EOY Performance Review**: Formal review using annual self-assessment template
- **Promotion Preparation**: Can be prepared for either mid-year or EOY cycle
