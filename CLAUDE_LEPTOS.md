# SHARED_CLAUDE.md

This file provides common guidance to Claude Code (claude.ai/code) when working with Leptos projects.

## Required Research and Analysis

### Core Principle: ASK QUESTIONS. LOTS OF THEM.
**NEVER ASSUME. ALWAYS CLARIFY.**

Before implementing any feature or making changes, you MUST:

1. **Ask clarifying questions about**:
   - Requirements and expected behavior
   - Edge cases and error handling scenarios
   - Integration with existing systems and components
   - User experience considerations and accessibility
   - Performance implications and optimization needs

2. **Analyze the existing codebase thoroughly**:
   - Search for similar functionality or components that already exist
   - Check `Cargo.toml` and feature flags for available dependencies
   - Review the project structure and understand the architecture
   - Look for established patterns and conventions to follow

3. **Check git history for context**:
   - Look at recent commits related to the area you're working on
   - Understand the evolution of the codebase and any patterns established
   - Review commit messages for insights into decision-making

4. **Validate before proceeding**:
   - Always run `just test` before making changes to establish a baseline
   - Ensure you understand how the existing code works
   - Check for any existing documentation or README files

5. **Research existing patterns**:
   - Look for similar components or functionality to maintain consistency
   - Follow established naming conventions and code organization
   - Understand the feature flag system and islands architecture

## Code Quality and Assessment Standards

### Honest Technical Assessment
- **Acknowledge limitations**: Always be transparent about potential issues, complexity, or areas of uncertainty
- **Admit when unsure**: If you don't fully understand something, say so and research further
- **Highlight trade-offs**: Explain the pros and cons of different approaches
- **Be realistic about timelines**: Don't underestimate complexity, especially with Rust/Leptos learning curves

### Clear Coding Principles
- **Self-documenting code**: Write code that explains its purpose through clear naming and structure
- **COMMENT THE WHY**: Only explain why, never what. Code shows what
- **Maintainable solutions**: Consider the developer who will work on this code months later
- **Consistent patterns**: Follow established conventions and architectural patterns in the codebase
- **Minimal complexity**: Choose the simplest solution that meets requirements

### Context Preservation
- **Document decisions**: Explain why certain approaches were chosen in comments or commit messages
- **Preserve reasoning**: Keep track of architectural decisions and their rationale
- **Link to references**: Include links to relevant documentation, issues, or discussions
- **Historical context**: Understand and respect the evolution of the codebase

### Documentation Standards
- **Component documentation**: Clearly document Leptos component props, behavior, and usage
- **Feature explanations**: Explain how new features integrate with existing architecture
- **Error scenarios**: Document potential failure modes and how they're handled
- **Update relevant docs**: Keep README files and project documentation current

## Enhanced Git Commit Guidelines

### Conventional Commits Standard

All commits MUST follow the Conventional Commits specification:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Commit Types**:
- **feat**: New feature or functionality
- **fix**: Bug fix or correction
- **docs**: Documentation changes only
- **style**: Code style changes (formatting, missing semicolons, etc.)
- **refactor**: Code refactoring without changing functionality
- **test**: Adding or modifying tests
- **chore**: Maintenance tasks, dependency updates, build changes

**Examples**:
```
feat(auth): add user authentication system
fix(cart): resolve checkout calculation error
docs: update README with new installation steps
refactor(components): simplify header component structure
test(api): add integration tests for user endpoints
chore: update leptos to v0.8.3
```

### Commit Message Guidelines

- **Use imperative mood**: "add feature" not "added feature"
- **Be descriptive**: Explain what and why, not just what
- **Keep first line under 50 characters**: For better readability
- **Use body for detailed explanations**: When necessary
- **Reference issues**: Use "Closes #123" or "Fixes #456"
- **NEVER mention "Claude" or "AI"**: Keep commits professional without AI references

## Development Workflow Checklist

### Pre-Implementation Phase

**Before writing any code, complete this checklist:**

1. **Requirements Analysis**:
   - [ ] Clarify the exact requirements and expected behavior
   - [ ] Identify edge cases and error scenarios
   - [ ] Understand integration points with existing systems
   - [ ] Consider accessibility and user experience implications

2. **Codebase Research**:
   - [ ] Search for similar existing functionality or components
   - [ ] Review `Cargo.toml` dependencies and available features
   - [ ] Check recent git history for related changes
   - [ ] Understand the current architecture and patterns

3. **Technical Planning**:
   - [ ] Choose appropriate Leptos patterns (islands, server functions, etc.)
   - [ ] Plan component structure and data flow
   - [ ] Consider performance implications
   - [ ] Review Leptos documentation: https://docs.rs/leptos/latest/leptos/
   - [ ] Check GitHub issues for known problems: https://github.com/leptos-rs/leptos

### Implementation Phase

**During development:**

1. **Setup and Baseline**:
   - [ ] Run `just test` to establish working baseline
   - [ ] Create feature branch if needed
   - [ ] Ensure development environment is ready

2. **Code Development**:
   - [ ] Follow established naming conventions and patterns
   - [ ] Write self-documenting code with clear variable names
   - [ ] Add comments explaining WHY, not what
   - [ ] Handle error cases appropriately
   - [ ] Follow Leptos best practices for islands architecture

3. **Testing During Development**:
   - [ ] Test functionality as you build
   - [ ] Verify both server-side and client-side behavior
   - [ ] Check for console errors and warnings
   - [ ] Test edge cases and error scenarios

### Quality Assurance Phase

**Before considering the work complete:**

1. **Code Quality**:
   - [ ] Run `just fmt` to ensure consistent formatting
   - [ ] Run `just test` to verify all tests pass
   - [ ] Check for compiler warnings and resolve them
   - [ ] Review code for maintainability and clarity

2. **Functionality Testing**:
   - [ ] Test the feature end-to-end
   - [ ] Verify integration with existing components
   - [ ] Test responsive design and accessibility
   - [ ] Check browser compatibility if relevant

3. **Documentation**:
   - [ ] Update relevant documentation files
   - [ ] Add inline documentation for complex logic
   - [ ] Update component props documentation
   - [ ] Consider if README needs updates

### Post-Implementation Review

**After completing the feature:**

1. **Final Validation**:
   - [ ] Run complete test suite one final time
   - [ ] Review git diff for any unintended changes
   - [ ] Ensure no debug code or console.log statements remain
   - [ ] Verify performance impact is acceptable

2. **Knowledge Transfer**:
   - [ ] Document any new patterns or decisions made
   - [ ] Note any potential future improvements
   - [ ] Update project documentation if architecture changed

## Technical Implementation Standards

### Naming Conventions

**Leptos Components**:
- **Function definition**: Always use snake_case: `fn header_example_1()` ✅
- **Generated component**: PascalCase is auto-generated: `HeaderExample1`
- **NEVER use PascalCase** in function definitions: `fn HeaderExample1()` ❌
- **When searching**: Always search for the PascalCase version for component usage

**Leptos Islands**:
- **CRITICAL**: Islands must have globally unique names across the entire application
- **Use descriptive prefixes**: `calendar_date_picker` not `date_picker`
- **Module-based naming**: `admin_user_list`, `booking_form_submit`
- **Avoid generic names**: Prevents linking errors from duplicate symbols

**General Naming**:
- **Variables**: Use descriptive names that explain purpose, not just type
- **Functions**: Use verbs that clearly describe what the function does
- **Constants**: Use SCREAMING_SNAKE_CASE for compile-time constants
- **Modules**: Use single-file modules, never `mod.rs` directories

### Planning Methodology

**Before Implementation**:
1. **Define the problem clearly**: Write a one-sentence problem statement
2. **Research existing solutions**: Check if similar functionality exists
3. **Design the interface first**: Plan the API before implementation
4. **Consider failure modes**: Think about what could go wrong
5. **Plan for testing**: Consider how you'll verify it works

**During Planning**:
- **Start with the simplest solution**: Add complexity only when needed
- **Consider future extensibility**: But don't over-engineer
- **Document assumptions**: Make implicit requirements explicit
- **Plan for edge cases**: Handle boundary conditions

### Security Requirements

**Data Handling**:
- **Never log sensitive data**: Passwords, tokens, personal information
- **Validate all inputs**: Both client-side and server-side
- **Use type safety**: Leverage Rust's type system for validation
- **Handle errors securely**: Don't expose internal details

**Authentication & Authorization**:
- **Follow principle of least privilege**: Grant minimum necessary permissions
- **Validate session state**: Check authorization for each protected action
- **Use secure defaults**: Fail closed, not open
- **Audit sensitive operations**: Log security-relevant events

### Implementation Pattern Guidelines

**Leptos-Specific Patterns**:
- **Islands architecture**: Use islands for interactive components only
- **Server functions**: Keep server-side logic separate and secure
- **Feature flags**: Use conditional compilation for different builds
- **Error boundaries**: Handle errors gracefully in the UI

**General Patterns**:
- **Separation of concerns**: Keep different responsibilities in different modules
- **Dependency injection**: Make dependencies explicit and testable
- **Error handling**: Use Result types, handle errors at appropriate levels
- **Resource management**: Use RAII patterns, avoid resource leaks

**Code Organization**:
- **Single responsibility**: Each function/module should have one clear purpose
- **Consistent interfaces**: Similar functions should work in similar ways
- **Clear boundaries**: Well-defined interfaces between modules
- **Documentation**: Code should be self-documenting with strategic comments

## Error Handling and Type Safety

### Error Handling Patterns

**Rust Error Handling**:
- **Use Result types**: Return `Result<T, E>` for operations that can fail
- **Avoid unwrap() in production**: Use `expect()` with meaningful messages or proper error handling
- **Propagate errors appropriately**: Use `?` operator for error propagation
- **Handle errors at the right level**: Don't handle errors too early or too late

**Leptos-Specific Error Handling**:
- **Server functions**: Return appropriate error types, handle both client and server errors
- **Resource loading**: Use `ErrorBoundary` components for graceful error display
- **Form validation**: Validate on both client and server sides
- **Islands hydration**: Handle hydration failures gracefully

**Error Types to Consider**:
```rust
// ✅ Good: Specific error types
#[derive(Debug, Clone)]
pub enum AuthError {
    InvalidCredentials,
    SessionExpired,
    NetworkError(String),
}

// ❌ Avoid: Generic error strings
fn login() -> Result<User, String>
```

### Type Safety Recommendations

**Leverage Rust's Type System**:
- **Use newtypes**: Wrap primitive types to prevent confusion (`UserId(u32)` vs raw `u32`)
- **Enum for states**: Model different states explicitly rather than using booleans
- **Builder pattern**: For complex configurations with many optional parameters
- **Phantom types**: For compile-time safety without runtime cost

**Leptos Type Safety**:
- **Typed props**: Use proper types for component props, avoid `String` for everything
- **Signal types**: Be explicit about signal types, use `RwSignal<T>` appropriately
- **Server function types**: Ensure serializable types for server communication

**Examples**:
```rust
// ✅ Good: Typed and explicit
#[derive(Clone, Debug, PartialEq)]
pub struct UserId(pub u32);

#[derive(Clone, Debug)]
pub enum LoadingState<T> {
    Loading,
    Loaded(T),
    Error(String),
}

// ❌ Avoid: Unclear types
fn get_user(id: u32) -> Option<String>
```

### Defensive Programming Practices

**Input Validation**:
- **Validate at boundaries**: Check inputs at system boundaries (APIs, user input)
- **Sanitize data**: Clean and validate data before processing
- **Use type constraints**: Let the type system enforce validity
- **Fail fast**: Detect problems as early as possible

**Null Safety**:
- **Use Option<T>**: Instead of nullable values
- **Handle None cases**: Always consider what happens when Option is None
- **Avoid unsafe code**: Unless absolutely necessary and well-documented

**Resource Management**:
- **Use RAII**: Resources should be automatically cleaned up
- **Handle cleanup**: Ensure proper cleanup in error scenarios
- **Monitor resource usage**: Be aware of memory and connection limits

### Validation Requirements

**Client-Side Validation**:
- **Immediate feedback**: Validate as user types for better UX
- **Clear error messages**: Show what's wrong and how to fix it
- **Accessible validation**: Ensure screen readers can understand errors
- **Never trust client-side only**: Always validate on server too

**Server-Side Validation**:
- **Comprehensive checks**: Validate all business rules and constraints
- **Security validation**: Check for injection attacks, XSS, etc.
- **Rate limiting**: Prevent abuse through validation
- **Audit trail**: Log validation failures for security monitoring

**Data Integrity**:
- **Database constraints**: Use DB-level constraints where possible
- **Atomic operations**: Ensure data consistency with transactions
- **Referential integrity**: Maintain proper relationships between data
- **Migration safety**: Handle schema changes without data loss

**Validation Examples**:
```rust
// ✅ Good: Comprehensive validation
#[derive(Debug, Clone, serde::Deserialize)]
pub struct CreateUserRequest {
    #[serde(deserialize_with = "validate_email")]
    pub email: String,
    #[serde(deserialize_with = "validate_password")]
    pub password: String,
}

fn validate_email(email: &str) -> Result<String, ValidationError> {
    // Email format validation
    // Length validation
    // Domain validation
}

// ❌ Avoid: No validation
fn create_user(email: String, password: String) -> User
```

## Philosophical Development Principles

### Core Development Philosophy

**Write code as if the person maintaining it will be someone else entirely**: Always assume that someone unfamiliar with your code will need to understand, modify, and debug it. This person might be under pressure, working late, or dealing with urgent production issues.

**Systematic and thorough approach**: 
- Take time to understand the problem completely before implementing
- Research existing solutions and patterns
- Consider edge cases and failure modes
- Plan for future maintenance and extension

**Continuous learning and validation**:
- Stay curious about new approaches and technologies
- Regularly validate your assumptions through testing
- Learn from code reviews and feedback
- Keep up with Rust and Leptos ecosystem changes

**Long-term thinking**:
- Consider the lifetime of the code you're writing
- Make decisions that will age well
- Document context and reasoning for future developers
- Balance immediate needs with long-term maintainability

### Practical Applications

**Code Clarity**:
- Choose clarity over cleverness
- Use descriptive names that explain intent
- Structure code in logical, predictable ways
- Avoid surprising or unexpected behaviors

**Maintainability Focus**:
- Write code that's easy to change and extend
- Minimize coupling between components
- Make dependencies explicit and manageable
- Consider how changes will impact other parts of the system

**Quality Mindset**:
- Treat code quality as a feature, not a luxury
- Invest time in good abstractions and clear interfaces
- Refactor regularly to prevent technical debt
- Take pride in well-crafted, maintainable code

**Empathy for Future Developers**:
- Leave helpful comments explaining complex logic
- Document assumptions and constraints
- Provide clear error messages and debugging information
- Consider the debugging experience when writing code

### Balancing Principles

**Simplicity vs. Flexibility**: Start simple and add complexity only when needed
**Performance vs. Readability**: Optimize for readability first, then performance when necessary
**Reusability vs. Specificity**: Build for current needs, but consider future reuse
**Innovation vs. Stability**: Use proven patterns for critical systems, experiment in safe spaces

## Leptos-Specific Development Notes

### Leptos View Type Compatibility

**CRITICAL**: When using conditional rendering (`if`/`else`) or multiple view branches in Leptos, the Rust compiler requires all branches to return the same type. This often causes compilation errors like:

```
expected struct `View<HtmlElement<Div, (Class<...>,), ...>>`
found struct `View<HtmlElement<Div, (Class<...>,), ...>>`
```

**Solution**: Use `Either<L, R>` types to handle different view structures:

```rust
// ❌ This will cause type errors:
{if condition {
    view! { <div>...</div> }
} else {
    view! { <p>...</p> }
}}

// ✅ Correct approach:
{if condition {
    Either::Left(view! { <div>...</div> })
} else {
    Either::Right(view! { <p>...</p> })
}}
```

**Common scenarios requiring Either**:
- Different HTML tags (div vs p, span vs button, etc.)
- Different component types
- Different number of child elements  
- Different attributes or structure complexity
- Conditional component inclusion

**Nested conditions** may require nested Either types:
```rust
Either::Left(if inner_condition {
    Either::Left(view! { ... })
} else {
    Either::Right(view! { ... })
})
```

### Working with Features

When adding new functionality, follow the existing feature pattern:
- Public features for client-side code
- `-ssr` suffix features for server-side code
- Conditional compilation using `#[cfg(feature = "...")]`

## Legacy Git Commit Workflow

**COMMIT WORKFLOW**: 
- DO NOT automatically commit changes after completing work
- Allow the user to test the implementation before committing
- Only commit when explicitly asked by the user
- If the user asks to work on a new feature but there are uncommitted changes, ask if they forgot to commit first instead of starting the new work

**TESTING AFTER CHANGES**:
- After completing any changes, always run `just test` to verify everything still works
- This helps catch any regressions or issues before the user tests manually

**FORMATTING AFTER CHANGES**:
- Always run `just fmt` after making code changes to ensure consistent formatting
- This should be done before committing any changes

## NC-Leptos Local Development

If a project is using `nc-leptos` or `nc_leptos` from GitHub, you can find the local development files at:

**Path**: `~/projects/leptos/nc-leptos`

**Structure**:
- `examples/` - Example applications demonstrating nc-leptos usage
- `nc-leptos/` - The main library code and components

# important-instruction-reminders
Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.
