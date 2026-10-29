
-- IT Helpdesk Ticket Analysis
-- Analysis: Category-Level Backlog and Risk
-- Purpose: Identify categories with large unresolved backlogs,
-- high-priority concentration, and aging Critical tickets


-- Analysis 1: Unresolved Tickets by Category

SELECT
    c.category,
    COUNT(*) AS unresolved_tickets,
    SUM(
        CASE
            WHEN t.priority IN ('High', 'Critical') THEN 1
            ELSE 0
        END
    ) AS high_critical_tickets,
    ROUND(
        AVG(julianday('now') - julianday(t.created_date)),
        2
    ) AS avg_ticket_age_days
FROM tickets AS t
JOIN categories AS c
    ON t.category_id = c.category_id
WHERE t.status != 'Resolved'
GROUP BY c.category
ORDER BY unresolved_tickets DESC;


-- Analysis 2: High/Critical Concentration Within Each Category

SELECT
    c.category,
    COUNT(*) AS unresolved_tickets,
    SUM(
        CASE
            WHEN t.priority IN ('High', 'Critical') THEN 1
            ELSE 0
        END
    ) AS high_critical_tickets,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN t.priority IN ('High', 'Critical') THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS high_critical_pct
FROM tickets AS t
JOIN categories AS c
    ON t.category_id = c.category_id
WHERE t.status != 'Resolved'
GROUP BY c.category
ORDER BY high_critical_pct DESC;


-- Analysis 3: Unresolved Critical Tickets Requiring Review

SELECT
    t.ticket_id,
    c.category,
    t.priority,
    t.status,
    t.created_date,
    ROUND(
        julianday('now') - julianday(t.created_date),
        2
    ) AS ticket_age_days,
    t.description
FROM tickets AS t
JOIN categories AS c
    ON t.category_id = c.category_id
WHERE t.status != 'Resolved'
  AND t.priority = 'Critical'
ORDER BY t.created_date ASC;
