-- =========================================
-- Operational Cost Leakage Audit Queries
-- =========================================

-- 1. Overbilling Detection
SELECT
    v.vendor_name,
    COUNT(*) AS overbilled_invoices,
    ROUND(SUM(i.billed_amount - i.expected_amount), 2) AS total_overbilled_amount
FROM invoices i
JOIN vendors v ON i.vendor_id = v.vendor_id
WHERE i.billed_amount > i.expected_amount
GROUP BY v.vendor_name
ORDER BY total_overbilled_amount DESC;

-- 2. Post-Disconnect Billing Audit
SELECT
    s.service_id,
    s.service_type,
    s.disconnect_date,
    i.invoice_date,
    i.billed_amount,
    v.vendor_name
FROM services s
JOIN invoices i ON s.service_id = i.service_id
JOIN vendors v ON i.vendor_id = v.vendor_id
WHERE s.status = 'Disconnected'
  AND i.invoice_date > s.disconnect_date
ORDER BY i.invoice_date DESC;

-- 3. Vendor Risk Scoring
SELECT
    v.vendor_name,
    COUNT(*) AS total_invoices,
    SUM(CASE WHEN i.billed_amount > i.expected_amount THEN 1 ELSE 0 END) AS overbilled_count,
    ROUND(
        1.0 * SUM(CASE WHEN i.billed_amount > i.expected_amount THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS risk_score
FROM invoices i
JOIN vendors v ON i.vendor_id = v.vendor_id
GROUP BY v.vendor_name
ORDER BY risk_score DESC;

