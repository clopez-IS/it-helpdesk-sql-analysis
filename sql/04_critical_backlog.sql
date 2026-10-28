
-- IT Helpdesk Ticket Analysis
-- Analysis: Unresolved Critical Tickets
-- Purpose: Identify high-risk tickets requiring investigation or escalation

SELECT
    t.ticket_id,
    tech.name AS technician_name,
    t.priority,
    t.status,
    t.created_date,
    ROUND(
        julianday('now') - julianday(t.created_date),
        2
    ) AS ticket_age_days,
    t.description
FROM tickets AS t
LEFT JOIN technicians AS tech
    ON t.technician_id = tech.technician_id
WHERE t.priority = 'Critical'
  AND t.status != 'Resolved'
ORDER BY ticket_age_days DESC;
