
-- IT Helpdesk Ticket Analysis
-- Analysis: Unresolved Backlog by Priority
-- Purpose: Summarize unresolved ticket volume, status, and age by priority


SELECT
    priority,
    COUNT(*) AS unresolved_tickets,
    SUM(CASE WHEN status = 'Open' THEN 1 ELSE 0 END) AS open_tickets,
    SUM(CASE WHEN status = 'In Progress' THEN 1 ELSE 0 END) AS in_progress_tickets,
    SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) AS pending_tickets,
    ROUND(
        AVG(julianday('now') - julianday(created_date)),
        2
    ) AS avg_ticket_age_days,
    ROUND(
        MAX(julianday('now') - julianday(created_date)),
        2
    ) AS oldest_ticket_age_days
FROM tickets
WHERE status != 'Resolved'
GROUP BY priority
ORDER BY
    CASE priority
        WHEN 'Critical' THEN 1
        WHEN 'High' THEN 2
        WHEN 'Medium' THEN 3
        WHEN 'Low' THEN 4
        ELSE 5
    END;
