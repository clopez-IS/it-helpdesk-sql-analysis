# IT Helpdesk Ticket Analysis

## Project Overview

This project analyzes IT helpdesk ticket data for a fictional company, Nexus Mobility Solutions, using SQL and Google Sheets. The goal is to evaluate ticket resolution performance, identify unresolved backlog risks, compare technician workloads, and develop actionable recommendations for IT support management.

## Business Problem

IT support teams need to resolve tickets efficiently while prioritizing critical incidents and managing aging requests. An excessive unresolved backlog can indicate potential service delays, workload imbalances, or issues requiring escalation.

This project uses SQL to investigate these patterns and presents the findings in a dashboard designed to support business decision-making.

## Tools Used

- **SQL:** Data analysis, aggregation, filtering, joins, and date calculations.
- **SQLite / DB Browser for SQLite:** Database querying and analysis.
- **Google Sheets:** KPI reporting, data visualization, and dashboard development.
- **GitHub:** Project documentation and portfolio presentation.

## Key Metrics

| Metric | Result |
|---|---:|
| Total tickets | 302 |
| Resolved tickets | 210 |
| Unresolved tickets | 92 |
| Average resolution time | 5.8 days |
| Unresolved High/Critical tickets | 32 |

## Key Findings

### 1. Resolution Time Varies by Priority

Average resolution time ranged from 1.38 days for Critical tickets to 10.09 days for Low-priority tickets.

**Business implication:** The results are consistent with priority-based triage. Management should also examine whether low-priority requests are waiting excessively long.

### 2. Software Tickets Show Elevated Priority Risk

Seven of the 11 unresolved Software tickets were classified as High or Critical, representing 63.64%.

**Business implication:** Investigating recurring software incidents and prioritizing high-risk issues may help reduce operational disruption.

### 3. Technician Workloads Differ

James Wilson had the largest unresolved workload, with 18 tickets. Olivia Brown had seven unresolved High/Critical tickets, while Daniel Kim's unresolved tickets had the highest average age at 255.24 days.

**Business implication:** Reviewing workload distribution, ticket complexity, priority mix, and assignment history could help identify opportunities for reassignment or escalation.

### 4. Critical Tickets Require Attention

The analysis identified nine unresolved Critical tickets. The oldest was approximately 295 days old at the time of the latest query.

Two tickets involved suspicious software or a possible malware alert, warranting prompt review in a real-world support environment.

**Business implication:** Critical tickets should be reviewed against escalation policies, with security-related incidents assessed promptly.

### 5. Resolution Performance Changes Over Time

The monthly analysis showed an average resolution time of 7.28 days in March 2026, compared with 4.91 days in February 2026.

**Business implication:** Management could investigate changes in ticket complexity, staffing, and workload to understand the increase.

## SQL Analysis Performed

The project includes analysis of:

- Overall ticket volume and resolution status.
- Average resolution time by priority.
- Unresolved tickets by category.
- High/Critical concentration within unresolved categories.
- Monthly resolution-time trends.
- Technician resolution performance.
- Unresolved workload by technician.
- Aging and unresolved Critical tickets.

SQL techniques include `SELECT`, `WHERE`, `GROUP BY`, aggregate functions, `CASE`, `LEFT JOIN`, date calculations using `julianday()`, and `ORDER BY`.

## Recommendations

Based on the findings, the following actions are recommended:

1. **Review the aging backlog:** Validate ticket ages, confirm ownership, and establish an escalation plan.
2. **Prioritize critical incidents:** Review overdue Critical tickets and assess security-related reports promptly.
3. **Investigate software issues:** Identify recurring problems contributing to the high-risk Software backlog.
4. **Evaluate workload distribution:** Compare technician assignments, ticket complexity, and priority mix before making staffing decisions.
5. **Monitor service performance:** Track resolution time and backlog metrics regularly to identify emerging problems.

## Dashboard

The Google Sheets dashboard presents key performance indicators and visualizations covering resolution time, unresolved ticket categories, High/Critical ticket concentration, and monthly resolution trends.

<img width="1216" height="620" alt="Screen Shot 2026-10-27 at 1 57 11 PM" src="https://github.com/user-attachments/assets/fbc3827c-a2f3-4fb1-84c1-b474b8fa0df7" />


## Project Structure

```text
it-helpdesk-ticket-analysis/
├── sql/
│   ├── 01_ticket_overview.sql
│   ├── 02_resolution_analysis.sql
│   ├── 03_technician_analysis.sql
│   └── 04_backlog_analysis.sql
├── dashboard/
│   └── dashboard_screenshot.png
└── README.md
```

The file names above are the proposed organization for the completed queries and dashboard image.

## Conclusion

This project demonstrates how SQL can transform raw IT helpdesk records into operational insights. By analyzing resolution times, priority levels, ticket aging, and technician workloads, the analysis identifies areas that management can investigate to improve support operations and backlog management.

The project combines technical SQL skills with business-oriented interpretation and data visualization.
