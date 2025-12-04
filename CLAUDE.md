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
