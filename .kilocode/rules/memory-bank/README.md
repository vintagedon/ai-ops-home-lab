# Memory Bank Templates

This directory contains universal templates for the `.kilocode/rules/memory-bank/` structure.

## Files Included

- **brief.md** - Foundational 2-3 paragraph context (what is this?)
- **product.md** - Why this exists, problems solved, goals
- **context.md** - Current state, next steps, active decisions (update frequently)
- **architecture.md** - System design, structure, patterns
- **tech.md** - Technologies, setup, constraints
- **tasks.md** - Repetitive workflows and procedures (optional)

## Usage

1. **Copy entire directory** to your project/area scope:
   ```bash
   cp -r memory-bank-templates/ {your-project}/.kilocode/rules/memory-bank/
   ```

2. **Fill in templates** with scope-specific content:
   - Replace `[PROJECT/AREA/SCOPE NAME]` with actual name
   - Replace `...` and placeholder sections with real content
   - Read HTML comments for guidance (they're invisible in rendered markdown)
   - Delete example comments once content is filled in

3. **Maintain regularly:**
   - **context.md** - Update after every significant work session
   - **architecture.md** - Update when patterns emerge or change
   - **tech.md** - Update when stack/setup changes
   - **product.md** - Update when vision evolves
   - **brief.md** - Rarely update (foundational)
   - **tasks.md** - Update as workflows emerge

## Template Adaptability

These templates work for:
- **Project scopes** (technical projects, coding repos)
- **Life area scopes** (career, personal development, organization)
- **Repository scopes** (code projects, libraries, frameworks)
- **Any scope** where an AI agent needs persistent context

HTML comments in each template show how to adapt language and focus for different scope types.

## Integration with AI Agents

**Session startup pattern:**
1. Agent loads custom instructions (role definition)
2. Agent loads AI Employee Handbook (operational procedures)
3. Agent loads memory bank files (scope-specific context)
4. Agent confirms: `[LifeOS Memory Bank: Active | Project/Area: {name}]`
5. Agent is ready with full context

**Session end pattern:**
1. Update context.md with session outcomes
2. Update other memory bank files if needed
3. Write work session summary (if using staging)
4. Commit changes to version control

## Philosophy

Memory banks are **infrastructure for persistent AI context**. They enable:
- Single-operator management of complex multi-project systems
- AI agents that maintain understanding across sessions
- Coordination between multiple specialized agents
- Knowledge accumulation over time
- Reduced cognitive overhead for context switching

**The investment in creating and maintaining memory banks pays exponential dividends in agent effectiveness and operator efficiency.**

## Resources

- **Original Methodology:** https://kilocode.ai/docs/advanced-usage/memory-bank
- **Memory Bank System Explainer:** See project documentation
- **AI Employee Handbook:** `astronomy-cluster/00-meta/claude-docs/ai-employee-handbook.md`

---

**Critical Success Factors:**
1. **Consistency** - Use same structure everywhere
2. **Brevity** - Concise, scannable, focused
3. **Currency** - Keep context.md current (stale = worse than nothing)
4. **Discipline** - Update at session end, don't defer
5. **Trust** - Agents must use memory banks as source of truth
