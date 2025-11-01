# Risk Scenario: Cost Overruns & Tool Sprawl

**Risk ID:** R09  
**Category:** Cost Management / Operational  
**Last Updated:** 2025-01-26  
**Owner:** CTO / CFO

---

## Risk Description

AI services introduce variable, usage-based costs that can rapidly escalate without proper controls. Simultaneously, the proliferation of AI tools across the organization—shadow AI adoption, overlapping capabilities, and lack of centralized governance—leads to tool sprawl that compounds costs and creates operational complexity.

The risk manifests in two interrelated patterns:

**Cost Overruns:** Usage-based pricing models (per-token, per-API-call, per-seat, per-feature) create unpredictable expenses. Costs can spike due to: heavy usage during project sprints, automated workflows with high API consumption, exploratory experimentation without budget guardrails, feature creep (enabling expensive features like browsing or code execution), or model upgrades with higher per-token costs.

**Tool Sprawl:** Without central governance, teams adopt AI tools independently. Each new tool brings: subscription costs, integration overhead, training requirements, security review burden, data handling complexity, and potential for duplicated capabilities. Sprawl fragments organizational knowledge (different teams using different tools for same tasks), complicates compliance (each tool requires separate risk assessment), and reduces negotiating leverage with vendors.

**Example Scenarios:**
- Engineer enables advanced model tier for "quick test," forgets to downgrade; $500 monthly cost persists
- Three different teams independently adopt three different code-assist tools with overlapping capabilities
- Automated workflow calls API 10K+ times daily due to retry loop bug; monthly bill increases 300%
- Department adopts premium AI tool without informing IT; discovered during annual audit
- Project team spins up multiple AI service accounts for testing; orphaned accounts continue billing
- Organization has 6 different AI subscriptions but only actively uses 2; $200/month wasted on unused licenses

---

## Risk Assessment

### Likelihood

**Rating:** MEDIUM

**Factors Increasing Likelihood:**
- AI-native operational model means high service usage and many touchpoints
- Usage-based pricing inherently variable and difficult to predict
- Rapid pace of AI tool innovation creates temptation to try new services
- Small organization lacks dedicated procurement/IT oversight for decentralized tool adoption
- Developer autonomy culture encourages experimentation without approval workflows
- Credit card sign-ups for AI services enable shadow IT
- Monthly subscription costs seem small individually (~$20-50/month) but compound

**Factors Decreasing Likelihood:**
- Explicit model approval process requires board review for new tools
- Data classification policy restricts which models can process which data (limits sprawl)
- CTO approval required for new vendor/service onboarding
- Monthly financial review includes line-item AI costs
- Role-based AI stack explicitly defines "who uses what" to prevent overlap

### Impact

**Rating:** MEDIUM

**Potential Impacts:**
- **Technical:** Operational complexity from managing multiple tools, integration overhead, training burden, potential for configuration errors across multiple systems
- **Business:** Budget overruns reduce resources available for other priorities, unpredictable costs complicate financial planning, productivity loss from context-switching between tools
- **Reputational:** Minimal external impact, but internal perception of "governance theater" if tool sprawl persists despite policies
- **Legal/Compliance:** Each new tool requires separate compliance assessment, increasing audit burden and risk of gaps
- **Safety:** Minimal direct safety impact, but tool sprawl increases attack surface and secret exposure risks
- **Financial:** Direct cost of redundant subscriptions, wasted spend on unused features, opportunity cost of budget consumed by unmanaged tools

**Impact Quantification:**
- Current monthly AI costs: ~$60/month ($20 Gemini Pro + $20 Claude Sonnet + $20 GLM-4)
- Unmanaged scenario: Could easily grow to $300-500/month with tool sprawl (5-8x increase)
- Annual impact: $3K current vs $6K-9K unmanaged = $3K-6K annual waste
- For small org with limited budget, $500/month AI costs become material line item
- Operational overhead: Each additional tool requires ~8 hours setup + 2 hours/month maintenance

### Risk Level

**Overall Risk Rating:** MEDIUM

**Rationale:** Medium likelihood (active usage, experimentation culture, small org lacks dedicated oversight) × Medium impact (material cost increase, operational overhead) = MEDIUM risk requiring management but not immediate crisis. Unlike HIGH-risk security threats, cost/sprawl risks are gradual and manageable with process controls. However, left unmanaged, can compound into significant budget and operational burden.

---

## Current Controls

### Technical Controls

- **Budget Alerts:** Monthly financial review includes AI service costs as distinct line item
- **Single Sign-On Enforcement:** Where possible (Gemini via Workspace), SSO limits account proliferation
- **Centralized Billing:** All approved services billed to organizational accounts, not individual credit cards

### Process Controls

- **Model Approval Process:** New AI models/services require AI Review Board approval (documented in AI Governance Policy)
- **Quarterly Service Reviews:** Board reviews all approved services quarterly; identifies unused or underutilized subscriptions
- **Role-Based AI Stack:** Explicit assignment of models to roles reduces likelihood of redundant tool adoption ("if Engineer needs code assist, use existing Gemini/Claude, not new tool")
- **Procurement Gatekeeping:** CTO approval required for any new vendor/service contract, including AI tools

### Organizational Controls

- **AI Governance Policy:** Defines approved model inventory and process for additions
- **Acceptable Use Policy:** Users educated on "use approved tools first before requesting new ones"
- **Cost Transparency:** Monthly AI costs communicated to team; creates awareness of spend

---

## Residual Risk

**Residual Risk Level:** LOW-MEDIUM

**Analysis:** 

Current controls substantially reduce risk from MEDIUM to LOW-MEDIUM. Strong governance (approval process, quarterly reviews, CTO gatekeeping) prevents most tool sprawl. Explicit role-based stack guidance reduces likelihood of redundant adoptions. Monthly financial visibility catches cost anomalies before they compound.

**Remaining Exposure Vectors:**
1. **Usage Spikes:** Current controls don't prevent legitimate high-usage scenarios (project sprint, large dataset processing). Could still see unexpected $200-300 monthly bill during intensive work periods.
2. **Feature Creep:** Users may enable expensive features (browsing, advanced models) without realizing cost implications. Current training doesn't include cost awareness.
3. **Shadow AI:** Technically possible for user to adopt tool with personal credit card for "quick test," bypassing controls. Relies on voluntary compliance and eventual detection.
4. **Orphaned Accounts:** Testing accounts or temporary service trials may remain active and billing after project completion. No automated detection.
5. **Vendor Price Changes:** Vendor can change pricing unilaterally. Current process doesn't include proactive monitoring of vendor pricing announcements.

**Scenarios Still Possible:**
- Engineer runs large batch job through API; $150 unexpected spike in monthly bill
- User tries new AI tool with free trial, forgets to cancel; $30/month charge appears 3 months later
- Vendor increases per-seat pricing from $20 to $30/month; 50% cost increase without usage change
- Project needs temporary access to premium feature; enabled for testing, never disabled

**Why Current Controls Don't Fully Mitigate:**
Current controls are primarily **procedural** (approval, review) rather than **preventive** (spending limits, automated alerts). Process controls work well for intentional new adoptions but less effective against accidental cost escalation, feature creep, or orphaned resources. Small organization lacks dedicated FinOps function to proactively optimize AI spend.

**Risk Acceptance Decision:**

- **Accepted By:** AI Review Board (CTO decision authority, CFO consulted)
- **Date:** 2025-01-26
- **Conditions:** Residual LOW-MEDIUM risk accepted for Phase 0.2-0.5 while organization remains <5 users and monthly AI spend <$100. If organization grows to 5+ users OR monthly spend exceeds $100, revisit controls and consider Priority 2 recommendations.
- **Review Frequency:** Quarterly review of AI costs as part of board meeting; triggered review if monthly spend increases >50% month-over-month

---

## Recommended Controls

### Priority 1 (Immediate/Short-term)

1. **AI Cost Awareness Training**
   - **Description:** Educate users on AI service pricing models, cost implications of features, and budget-conscious usage practices
   - **Implementation:** 
     - Create "AI Cost Fundamentals" training module
     - Explain per-token vs per-seat vs per-feature pricing
     - Provide cost comparison: "Gemini free tier vs Pro vs Advanced; when to use each"
     - Include "cost red flags": enabling browsing, using advanced models for simple tasks, large batch processing without estimation
     - Distribute monthly cost summary to team with context: "This month we spent $X, primary drivers were Y"
   - **Expected Impact:** Reduces likelihood of accidental cost escalation by 40-50% through informed usage decisions
   - **Effort:** Low (training material creation, ~2 hours delivery)
   - **Timeline:** 2 weeks
   - **Owner:** CTO

2. **Monthly Spend Threshold Alerts**
   - **Description:** Configure automated alerts when monthly AI spend exceeds defined thresholds; provides early warning before major overruns
   - **Implementation:**
     - Set tier alerts: $75 (yellow flag, informational), $100 (orange flag, review trigger), $150 (red flag, emergency review)
     - Configure email alerts to CTO + CFO
     - Include spend breakdown: per-service, per-user if available
     - Create response protocol: yellow = monitor, orange = investigate, red = immediate action (disable non-essential features, review usage patterns)
   - **Expected Impact:** Catches anomalous spending within days instead of discovering at month-end; limits maximum surprise to ~$50
   - **Effort:** Low (billing platform alert configuration, <1 hour)
   - **Timeline:** 1 week
   - **Owner:** CTO

### Priority 2 (Medium-term)

1. **Centralized AI Service Inventory Dashboard**
   - **Description:** Create single-pane-of-glass view of all AI services, costs, usage, and last-used date; improves visibility and enables proactive optimization
   - **Implementation:**
     - Spreadsheet or simple database tracking: service name, monthly cost, seats, features enabled, last usage date, owner, renewal date
     - Update monthly during financial review
     - Flag for review: not used in 30 days (candidate for cancellation), cost increased >20% month-over-month (investigate)
     - Share dashboard with board quarterly
   - **Expected Impact:** Identifies waste, unused subscriptions, optimization opportunities; improves budgeting accuracy
   - **Effort:** Low (initial setup ~2 hours, monthly maintenance ~30 minutes)
   - **Timeline:** 2-3 weeks
   - **Owner:** CTO with CFO review

2. **AI Service Consolidation Review**
   - **Description:** Actively evaluate opportunities to consolidate redundant capabilities into fewer services; reduce tool sprawl
   - **Implementation:**
     - Map current AI stack to use cases: "Gemini does X, Claude does Y, GLM-4 does Z"
     - Identify overlap: "Are we using 2+ tools for same task?"
     - Evaluate consolidation: "Could we eliminate GLM-4 and use Gemini for Public-External work?"
     - Consider enterprise/bundled pricing: "If we commit to Google Workspace AI, can we get volume discount?"
     - Implement consolidation decisions via standard approval process
   - **Expected Impact:** Potential 20-30% cost reduction through elimination of redundant subscriptions
   - **Effort:** Medium (requires usage analysis, vendor negotiations, migration planning)
   - **Timeline:** 4-6 weeks
   - **Owner:** CTO

### Priority 3 (Long-term/Strategic)

1. **FinOps for AI - Automated Cost Optimization**
   - **Description:** Implement automated spend optimization: auto-shutdown of unused resources, usage-based tier selection, batch job cost estimation
   - **Implementation:**
     - Develop scripts to monitor service usage; auto-disable features not used in 30 days
     - Create pre-job cost estimator for batch operations: "This will cost approximately $X to run"
     - Implement usage-based tier switching: automatically downgrade to free tier during low-usage periods
     - Schedule resource reviews: monthly scan for orphaned accounts, unused features
   - **Expected Impact:** Continuous optimization, 30-40% reduction in waste spending
   - **Effort:** High (requires custom development or third-party FinOps tool)
   - **Timeline:** 3-6 months
   - **Owner:** Engineering Lead with CTO oversight

---

## NIST AI RMF Mapping

### Relevant Functions

**GOVERN:**
- **GOVERN-1.1:** AI risk management culture and decisions (Cost management as part of responsible AI deployment culture)
- **GOVERN-1.3:** AI risk management processes (Approval process for new services, quarterly reviews)
- **GOVERN-4.1:** Resource requirements documented (Understanding cost structure before adoption)

**MAP:**
- **MAP-1.1:** Context established for AI system (Cost as contextual factor in deployment decisions)
- **MAP-5.2:** Environmental costs and benefits (Financial sustainability as environmental consideration)

**MEASURE:**
- **MEASURE-1.1:** Metrics defined (Cost per service, cost per user, cost trending)
- **MEASURE-2.1:** Traceability of AI system outcomes (Tracing costs to specific services, features, usage patterns)

**MANAGE:**
- **MANAGE-2.1:** Regular monitoring and review (Monthly financial review, quarterly service inventory)
- **MANAGE-4.1:** Operational use monitored (Usage patterns inform cost optimization)

### Framework Alignment Notes

This risk scenario addresses NIST AI RMF GOVERN-4.1 (resource requirements) and MANAGE-2.1 (monitoring). Cost management is integral to sustainable AI deployment—uncontrolled costs undermine organizational capacity for responsible AI governance. The quarterly review process ensures resources allocated to AI provide value. Tool sprawl prevention aligns with GOVERN-1.3 (structured processes for AI adoption).

---

## Related Artifacts

### Related Risks
- **R08:** Insufficient Access Controls (Related - poor access controls can enable shadow AI adoption)
- **R10:** Vendor Lock-in & Service Availability (Related - tool sprawl increases vendor dependencies)
- **R02:** Secrets & Credentials Leakage (Compounds - more tools = more credential management complexity)

### Affected Systems/Models
- All approved AI services in organizational inventory:
  - Gemini Pro 2.5 ($20/month)
  - Claude Sonnet 4 Pro ($20/month)
  - GLM-4 via Z.ai ($20/month)
- Future services require risk assessment before adoption

### Relevant Policies/Standards
- AI Governance Policy (Section 3: Decision-Making Authority for new service approval)
- AI Model Inventory (Appendix C: Tool Model Inventory - defines approved tools)
- Acceptable Use Policy (Section 2: Approved Tools - references inventory)
- Procurement Policy (if formal policy exists, reference here)

### Model Cards
- AI Model/Tool Inventory (Appendix C) - complete list of approved services with costs
- Service cards for each approved service (ChatGPT Business evaluation card shows cost analysis process)

### Decision Log References
- **DEC-2025-003:** GLM-4 Model Approval (Cost-benefit analysis included $20/month justified for Public-External use)
- Future decisions on service additions should reference this risk scenario in cost justification

---

## Monitoring & Detection

### Key Risk Indicators (KRIs)

1. **Monthly AI Spend**
   - **Metric:** Total monthly cost across all AI services
   - **Threshold:** >$100/month triggers orange flag review; >$150/month red flag emergency review
   - **Frequency:** Real-time monitoring via billing alerts, monthly reporting
   - **Data Source:** Credit card statements, vendor billing dashboards

2. **Cost Growth Rate**
   - **Metric:** Month-over-month percentage change in AI spending
   - **Threshold:** >50% MoM increase triggers investigation; >100% triggers emergency review
   - **Frequency:** Monthly calculation
   - **Data Source:** Historical spend tracking

3. **Service Count**
   - **Metric:** Number of distinct AI services/subscriptions in active use
   - **Threshold:** >5 services suggests tool sprawl risk; triggers consolidation review
   - **Frequency:** Quarterly inventory count
   - **Data Source:** AI Service Inventory Dashboard

4. **Unused Service Detection**
   - **Metric:** Number of services not used in 30+ days
   - **Threshold:** >0 triggers cancellation evaluation
   - **Frequency:** Monthly review
   - **Data Source:** Usage logs, last-login tracking

5. **Cost per User**
   - **Metric:** Total monthly AI cost divided by number of active users
   - **Threshold:** >$50/user/month suggests inefficient tool mix or usage patterns
   - **Frequency:** Monthly calculation
   - **Data Source:** Billing data + user count

### Detection Methods

- **Billing Alert Automation:** Email alerts configured at $75, $100, $150 thresholds
- **Monthly Financial Review:** CTO reviews AI line item in monthly financial close; flags anomalies
- **Quarterly Board Review:** AI service inventory presented to board; identification of waste or optimization opportunities
- **Usage Pattern Analysis:** Review vendor dashboards for usage trends; identify heavy users or unusual patterns
- **Orphaned Account Audits:** Quarterly scan for accounts/subscriptions without recent activity
- **Vendor Pricing Monitoring:** Subscribe to vendor announcement lists; track pricing changes proactively

### Incident Response

**If this risk materializes:**

1. **Immediate Actions (Cost Spike):** 
   - Identify cause of spike: which service, which user, which feature
   - If caused by bug/misconfiguration: disable offending feature/workflow immediately
   - If caused by legitimate high usage: confirm budget headroom, consider temporary measures

2. **Immediate Actions (Tool Sprawl):** 
   - Identify shadow AI adoption: which tool, who adopted, what use case
   - Evaluate necessity: does approved stack already cover use case?
   - If redundant: cancel subscription, migrate workflows to approved tools
   - If fills gap: fast-track risk assessment and potential approval

3. **Escalation:** 
   - CTO notifies CFO of material cost overrun (>$50 over budget)
   - Board notified if tool sprawl indicates governance control failure

4. **Investigation:** 
   - Cost spike: Review usage logs, identify cost drivers, determine if preventable
   - Tool sprawl: Interview user/team to understand why approved tools insufficient

5. **Remediation:** 
   - Cost spike: Implement cost controls, adjust workflows, user training if human error
   - Tool sprawl: Consolidate to approved tools, strengthen approval process, communication to team

6. **Recovery:** 
   - Adjust budget if cost spike is new baseline
   - Implement one-time write-off for unexpected charges if vendor error
   - Update service inventory with lessons learned

7. **Lessons Learned:** 
   - Post-incident review within 2 weeks
   - Update training if user error contributed
   - Accelerate Priority 1/2 controls if incident reveals control gap
   - Update risk scenario with actual incident patterns

---

## Review History

| Date | Reviewer | Changes | Risk Level Change |
|------|----------|---------|-------------------|
| 2025-01-26 | CTO + CFO | Initial risk scenario creation | N/A → MEDIUM |
| 2025-01-26 | AI Review Board | Accepted residual LOW-MEDIUM risk with growth triggers | MEDIUM → LOW-MEDIUM (residual) |

**Next Scheduled Review:** 2025-04-26 (Quarterly)

---

## References & Resources

- FinOps Foundation: https://www.finops.org/
- Cloud FinOps Best Practices: https://www.finops.org/framework/
- AWS Cost Optimization: https://aws.amazon.com/aws-cost-management/
- OpenAI API Pricing: https://openai.com/pricing
- Google AI Pricing: https://cloud.google.com/pricing
- Anthropic Pricing: https://www.anthropic.com/pricing

---

## Notes

This risk is particularly relevant for small organizations where $100-200 monthly cost swings are material to budget. As organization grows, relative impact decreases but absolute cost increases, so controls remain important.

Current risk level (MEDIUM → LOW-MEDIUM residual) is acceptable for Phase 0.2-0.5 with <5 users. Growth to 5+ users or $100+/month spend triggers control upgrade (Priority 2 recommendations).

Key insight: **Cost discipline is part of AI governance.** Unmanaged costs undermine organizational capacity for responsible AI deployment. Tool sprawl creates operational overhead that compounds with organization scale. Early controls prevent future pain.
