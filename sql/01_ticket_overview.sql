
-- IT Helpdesk Ticket Analysis
-- Analysis: Overall Ticket Overview
-- Purpose: Measure total, resolved, and unresolved ticket volume

SELECT
    COUNT(*) AS total_tickets,
    SUM(
        CASE
            WHEN status = 'Resolved' THEN 1
            ELSE 0
        END
    ) AS resolved_tickets,
    SUM(
        CASE
            WHEN status != 'Resolved' THEN 1
            ELSE 0
        END
    ) AS unresolved_tickets,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN status = 'Resolved' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS resolution_rate_pct
FROM tickets;
