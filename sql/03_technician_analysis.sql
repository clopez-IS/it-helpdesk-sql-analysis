
-- IT Helpdesk Ticket Analysis
-- Analysis: Unresolved workload by technician

SELECT
    tech.name AS technician_name,
    COUNT(*) AS unresolved_tickets,
    SUM(
        CASE
            WHEN t.priority IN ('High', 'Critical')
            THEN 1
            ELSE 0
        END
    ) AS high_critical_tickets,
    ROUND(
        AVG(julianday('now') - julianday(t.created_date)),
        2
    ) AS avg_ticket_age_days,
    SUM(
        CASE
            WHEN t.status = 'Open' THEN 1
            ELSE 0
        END
    ) AS open_tickets
FROM tickets AS t
LEFT JOIN technicians AS tech
    ON t.technician_id = tech.technician_id
WHERE t.status != 'Resolved'
GROUP BY tech.name
ORDER BY unresolved_tickets DESC;
