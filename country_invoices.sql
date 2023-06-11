select BillingCountry , count(*)
from Invoice
GROUP BY BillingCountry;