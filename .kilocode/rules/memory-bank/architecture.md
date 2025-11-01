# [PROJECT/AREA/SCOPE NAME] Architecture

<!-- 
Purpose: System design, structure, patterns, and key decisions
Audience: AI agents needing to understand how this is organized/built
Update Frequency: When architectural patterns emerge or change
-->

## Overview

<!-- High-level architectural summary in 2-3 paragraphs -->

[PROJECT/AREA/SCOPE NAME] is architected as...

<!-- Describe the fundamental structure, organization, or design approach -->

## Core Components

<!-- For projects: technical components. For life areas: organizational areas. For repos: code modules -->

### [Component/Area 1]
**Purpose:** [What this does]  
**Location:** [Where this lives - path, directory, section]  
**Key Characteristics:** [Important details about this component]

### [Component/Area 2]
**Purpose:** [What this does]  
**Location:** [Where this lives - path, directory, section]  
**Key Characteristics:** [Important details about this component]

### [Component/Area 3]
**Purpose:** [What this does]  
**Location:** [Where this lives - path, directory, section]  
**Key Characteristics:** [Important details about this component]

## Structure

<!-- Directory/file structure, organizational hierarchy, or system layout -->

```
[project-root]/
├── [directory-1]/        # [Purpose]
│   ├── [subdirectory]/   # [Purpose]
│   └── [file-pattern]    # [Purpose]
├── [directory-2]/        # [Purpose]
│   └── [subdirectory]/   # [Purpose]
└── [directory-3]/        # [Purpose]
```

<!-- 
Adapt this to scope:
- Projects: File system structure
- Life areas: Organizational structure (how information/tasks are organized)
- Repos: Code architecture and module layout
-->

## Design Patterns and Principles

<!-- Architectural decisions, design patterns used, principles followed -->

### Key Patterns

- **[Pattern 1]:** [Description and rationale]
- **[Pattern 2]:** [Description and rationale]
- **[Pattern 3]:** [Description and rationale]

<!-- Example: "Event-driven architecture for decoupled component communication" -->

### Design Principles

1. **[Principle 1]:** [What and why]
2. **[Principle 2]:** [What and why]
3. **[Principle 3]:** [What and why]

<!-- Example: "KISS principle: Prefer simple, terminal-ready solutions over complex frameworks" -->

## Integration Points

<!-- How this connects to other systems, projects, areas, or external services -->

### Internal Integrations
- **[System/Project/Area]:** [How they connect, what's shared]
- **[System/Project/Area]:** [How they connect, what's shared]

### External Integrations
- **[Service/API/Tool]:** [Purpose, authentication, usage patterns]
- **[Service/API/Tool]:** [Purpose, authentication, usage patterns]

## Data Flow

<!-- How information/data moves through the system -->

```
[Source] → [Processing/Transformation] → [Destination]
```

<!-- Describe the primary data flows, pipelines, or information movement patterns -->

## Architectural Decisions

<!-- Record significant architectural decisions with rationale -->

### [Decision 1]: [Title]
**Date:** YYYY-MM-DD  
**Decision:** [What was decided]  
**Rationale:** [Why this decision was made]  
**Alternatives Considered:** [What else was considered and why rejected]  
**Implications:** [What this means for the system]

### [Decision 2]: [Title]
**Date:** YYYY-MM-DD  
**Decision:** [What was decided]  
**Rationale:** [Why this decision was made]  
**Alternatives Considered:** [What else was considered and why rejected]  
**Implications:** [What this means for the system]

## Constraints and Limitations

<!-- Technical, organizational, or resource constraints affecting architecture -->

- **[Constraint 1]:** [Description and impact]
- **[Constraint 2]:** [Description and impact]
- **[Constraint 3]:** [Description and impact]

<!-- Example: "Token budget requires on-demand file access patterns instead of loading entire vault" -->

## Future Considerations

<!-- Planned evolution, scalability considerations, known technical debt -->

### Planned Improvements
- [Architectural improvement or refactoring planned]
- [Architectural improvement or refactoring planned]

### Scalability Considerations
- [How this will scale or evolve]
- [What might need to change as this grows]

### Known Technical Debt
- [Shortcuts taken, areas needing refactoring]
- [Shortcuts taken, areas needing refactoring]

<!--
SCOPE ADAPTATIONS:

Projects: Technical architecture, system design, code patterns
Life Areas: Organizational architecture, information structure, workflow patterns
Repositories: Code architecture, module design, dependency structure

This file should answer "How is this built/organized?" at a level that guides
decision-making without requiring constant reference to implementation details.
-->
