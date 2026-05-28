# Global Claude Code Instructions

These instructions apply to all Claude Code sessions for this user.

## Markdown Table Formatting

**IMPORTANT:** When creating or editing Markdown tables, always align the vertical pipes (|) for readability.

### ✅ Good (aligned pipes):

```markdown
| Column 1           | Column 2        | Column 3      |
| ------------------ | --------------- | ------------- |
| Short              | Medium length   | Longer value  |
| Another row        | More data       | Final column  |
```

### ❌ Bad (unaligned pipes):

```markdown
| Column 1 | Column 2 | Column 3 |
| --- | --- | --- |
| Short | Medium length | Longer value |
| Another row | More data | Final column |
```

**Implementation:**
- Calculate the maximum width needed for each column
- Pad cells with spaces to align all pipes vertically
- Makes tables much easier to read and edit in plain text
- Applies to all Markdown files (.md), especially documentation, README files, and discovery documents

## Git Commits

**IMPORTANT:** Do NOT add Claude Code attribution to commit messages.

### ❌ Never include:
- `🤖 Generated with [Claude Code](https://claude.com/claude-code)`
- `Co-Authored-By: Claude <noreply@anthropic.com>`
- Any Claude Code branding or attribution

### ✅ Commit message format:
- Use conventional commit format
- Write in imperative mood ("Fix bug" not "Fixed bug")
- Keep subject line under 50 characters
- Explain what and why, not how
- Separate subject from body with blank line
- Wrap body at 72 characters

### Example good commit:
```
Add phone number source tracking

Implements source tracking for phone number updates (CM-10579).
Captures origin of changes for audit and debugging purposes.

- Add phone_number_source columns to tables
- Update API controller to capture source
- Add comprehensive test coverage
```

## Communication Style

- Be concise and direct
- Avoid unnecessary superlatives or praise
- Focus on technical accuracy and problem-solving
- When uncertain, investigate before responding

## Code Quality

- Follow project-specific CLAUDE.md instructions when present
- Prefer editing existing files over creating new ones
- Add clear comments explaining "why" not just "what"
- Consider edge cases and error handling

## Documentation

- Keep documentation up to date with code changes
- Use clear examples
- Format tables with aligned pipes (see above)
- Document assumptions and limitations

## Session Handoffs

Per-project `HANDOFF.md` files live at project roots (gitignored globally via `~/.gitignore`).
Central briefing at `~/.handoffs/index.md` aggregates all projects.

- `/handoff` — Context-aware: writes to `.discovery/handoff.md` (ticket worktree) or `HANDOFF.md` (project root). Updates central index after writing.
- `/session-briefing` — Recap of the current Claude session (what we did, decisions, still to do).
- `/project-briefing` — Status of the current project (branches, worktrees, PRs, Docker, last handoff). Detects project from working directory.
- `/global-briefing` — Morning briefing across all projects. Reads `~/.handoffs/index.md`.
- `session-briefing` — CLI script that regenerates `~/.handoffs/index.md`. Use `--cat` to print, `--open` to edit.
- `/familiarize` — Reads both project-level `HANDOFF.md` and ticket-level `.discovery/handoff.md` when resuming.

## The Ledger

Personal knowledge capture at `~/.ledger/`. Each file is a category with workflow
instructions at the top (HTML comment). Read those instructions before adding or
searching. Full guide: `~/.ledger/USAGE.md`.

**Error lookup** (when user pastes an error or stack trace):
1. Search `~/.ledger/errors-bugs.md` first
2. Then search project-specific troubleshooting docs
3. Report: status, fix, version resolved, whether worktree needs updating
4. If new: add to `~/.ledger/errors-bugs.md` with Status=Open

**Capture** (when user shares an idea, observation, or note):
Pick the category from `~/.ledger/README.md`, add to the appropriate file.

**Maintenance** (opportunistic): When you open a Ledger file and notice entries
that appear stale (e.g., an "Open" error that has since been resolved), mention
it to the user.

If `~/.ledger/` doesn't exist, skip Ledger operations.
