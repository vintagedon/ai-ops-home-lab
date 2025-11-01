# [PROJECT/AREA/SCOPE NAME] Tasks and Workflows

<!-- 
Purpose: Repetitive workflows, procedures, and operational patterns
Audience: AI agents executing common tasks within this scope
Update Frequency: As new patterns emerge or workflows change
Note: This file is OPTIONAL - only create if repetitive workflows exist
-->

## Common Workflows

<!-- Standard procedures for frequent operations -->

### [Workflow 1]: [Name]

**When to use:** [Trigger or situation]  
**Frequency:** [How often this happens]

**Steps:**
1. [Step with specific action]
2. [Step with specific action]
3. [Step with specific action]
4. [Step with specific action]

**Expected Outcome:** [What success looks like]  
**Common Issues:** [Problems that might arise and solutions]

---

### [Workflow 2]: [Name]

**When to use:** [Trigger or situation]  
**Frequency:** [How often this happens]

**Steps:**
1. [Step with specific action]
2. [Step with specific action]
3. [Step with specific action]

**Expected Outcome:** [What success looks like]  
**Common Issues:** [Problems that might arise and solutions]

---

## Memory Bank Maintenance

<!-- Procedures for keeping the memory bank current -->

### Updating context.md

**When:** After every significant work session  
**What to update:**
1. Move completed items from "Next Steps" to "Recent Accomplishments"
2. Update "Current Phase" if phase changed
3. Update "Next Steps" with new actionable items
4. Document any new decisions in "Active Decisions"
5. Add/resolve blockers as appropriate
6. Update "Last Updated" date

**Quality check:** Does context.md accurately reflect current state?

---

### Updating architecture.md

**When:** When architectural patterns emerge or change  
**What to update:**
1. Add new components/areas as they're created
2. Document architectural decisions with rationale
3. Update design patterns if approach evolves
4. Record new integration points
5. Update constraints if environment changes

**Quality check:** Can someone understand the structure from this file alone?

---

### Updating tech.md

**When:** When dependencies added/removed or setup changes  
**What to update:**
1. Add new technologies to stack listing
2. Update version numbers for dependencies
3. Modify setup instructions if process changes
4. Add new troubleshooting entries for recurring issues
5. Update infrastructure details if environment changes

**Quality check:** Can someone set this up following these instructions?

---

## Session Management

<!-- Procedures for starting and ending work sessions -->

### Session Start Procedure

**Objective:** Load context and confirm understanding

1. **Load memory bank files**
   - Read brief.md (foundational context)
   - Read context.md (current state and next steps)
   - Scan architecture.md and tech.md as needed

2. **Confirm context**
   - Display: `[LifeOS Memory Bank: Active | Project/Area: {name}]`
   - Briefly summarize: Current phase, immediate next steps

3. **Verify currency**
   - Check "Last Updated" in context.md
   - If >7 days old, flag for human review

4. **Ready state**
   - Confirm understanding with operator
   - Proceed with work

---

### Session End Procedure

**Objective:** Update memory bank with session outcomes

1. **Update context.md**
   - Add accomplishments to "Recent Accomplishments"
   - Update "Next Steps" based on current state
   - Document decisions made during session
   - Add/resolve blockers
   - Update "Last Updated" date

2. **Update other files if needed**
   - architecture.md if design changed
   - tech.md if stack/setup changed
   - product.md if goals/vision evolved

3. **Create work session summary** (if using staging)
   - Write summary to staging/ for Vault Orchestrator
   - Include: What was done, patterns observed, coordination needs

4. **Commit changes** (if using version control)
   ```bash
   git add .kilocode/rules/memory-bank/
   git commit -m "Update memory bank: [what changed]"
   ```

5. **Context handoff**
   - Confirm memory bank is ready for next session
   - Note any urgent items for operator attention

---

## Automation Patterns

<!-- Common automation tasks or script patterns -->

### [Automation 1]: [Name]

**Purpose:** [What this automates]  
**Trigger:** [When/how this runs]

**Command:**
```bash
[command or script invocation]
```

**Expected Output:** [What happens]  
**Failure Handling:** [What to do if it fails]

---

### [Automation 2]: [Name]

**Purpose:** [What this automates]  
**Trigger:** [When/how this runs]

**Command:**
```bash
[command or script invocation]
```

**Expected Output:** [What happens]  
**Failure Handling:** [What to do if it fails]

---

## Coordination Protocols

<!-- For multi-agent environments: how to coordinate with other agents/areas -->

### Escalation to Human Operator

**When to escalate:**
- Architectural decisions outside established patterns
- Resource allocation or budget implications
- Conflicts between competing priorities
- Unclear requirements or ambiguous situations
- Any work that crosses scope boundaries

**How to escalate:**
1. Clearly describe the decision/issue
2. Present options with trade-offs
3. Recommend approach with rationale
4. Wait for operator decision before proceeding

---

### Cross-Project Coordination

**When coordination needed:**
- Work affects multiple projects/areas
- Shared resources or dependencies
- Integration changes that impact others

**Coordination method:**
1. Document need in context.md "Dependencies"
2. Write coordination note to staging/
3. Wait for Vault Orchestrator synthesis
4. Proceed based on coordinated plan

---

## Quality Checklists

<!-- Standards for deliverables and work products -->

### Code Quality Checklist
- [ ] Follows established patterns from architecture.md
- [ ] Includes inline comments for complex logic
- [ ] Has error handling for failure modes
- [ ] Tested locally before committing
- [ ] Documented in relevant memory bank files

### Documentation Quality Checklist
- [ ] Clear, concise language
- [ ] Includes examples where helpful
- [ ] Cross-references related documentation
- [ ] Follows formatting standards
- [ ] Updated date stamps where appropriate

### Deliverable Quality Checklist
- [ ] Meets stated requirements from context.md
- [ ] Aligns with architecture patterns
- [ ] Includes usage instructions
- [ ] Notes any limitations or constraints
- [ ] Ready for operator review

---

<!--
USAGE GUIDANCE:

This file captures REPETITIVE patterns - if you do something once, it doesn't 
belong here. If you do it regularly, document it.

Update this file when:
- New repetitive workflows emerge
- Automation patterns are established
- Quality standards evolve
- Coordination protocols change

Keep workflows actionable - specific steps, not vague guidance.

For life areas: "tasks" might be organizational workflows like "weekly review",
"capture new information", "process inbox", etc.

For projects/repos: "tasks" are development workflows like "add feature",
"fix bug", "deploy", "update dependencies", etc.
-->
