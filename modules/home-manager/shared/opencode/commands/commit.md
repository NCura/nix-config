---
description: Commit all changes using the git-commit-manager agent
---

Use the git-commit-manager agent to create properly formatted commits for ALL staged and unstaged changes. The agent will analyze all changes, group them logically, and create multiple commits if needed. By the end, the working directory must be clean with no uncommitted changes.

The agent will:
- Review all modified files (staged and unstaged)
- Group related changes together
- Create separate commits for unrelated changes
- Continue until all changes are committed
