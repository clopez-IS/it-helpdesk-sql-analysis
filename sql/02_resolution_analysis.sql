
-- IT Helpdesk Ticket Analysis
-- Analysis: Resolution Time by Priority
-- Purpose: Compare average resolution time across ticket priorities

SELECT
    priority,
    COUNT(*) AS resolved_tickets,
    ROUND(
        AVG(
            julianday(resolved_date) - julianday(created_date)
        ),
        2
    ) AS avg_resolution_days
FROM tickets
WHERE status = 'Resolved'
  AND resolved_date IS NOT NULL
GROUP BY priority
ORDER BY avg_resolution_days;


-- Analysis: Monthly Average Resolution Time

SELECT
    strftime('%Y-%m', resolved_date) AS resolution_month,
    COUNT(*) AS resolved_tickets,
    ROUND(
        AVG(
            julianday(resolved_date) - julianday(created_date)
        ),
        2
    ) AS avg_resolution_days
FROM tickets
WHERE status = 'Resolved'
  AND resolved_date IS NOT NULL
GROUP BY strftime('%Y-%m', resolved_date)
ORDER BY resolution_month;
