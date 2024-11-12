# Example Title: Database Choice for User Data

## Context and Problem Statement

We need a scalable database to store and manage user data efficiently as our user base grows.

## Decision Drivers

* Scalability
* Data consistency
* Ease of integration with existing services

## Considered Options

* PostgreSQL
* MongoDB
* Amazon DynamoDB

## Decision Outcome

Chosen option: **PostgreSQL** because it provides strong data consistency and aligns well with our need for complex queries.

### Consequences

* **Good:** Supports ACID compliance, enhancing data reliability.
* **Bad:** May require more tuning to achieve high performance with large datasets.

### Confirmation

We’ll confirm this decision through periodic load tests and performance reviews as the user base scales.

## Pros and Cons of the Options

### PostgreSQL

* **Good:** ACID compliance, robust community support.
* **Neutral:** Setup and tuning can be time-consuming.
* **Bad:** Lacks native horizontal scaling.

### MongoDB

* **Good:** Schema flexibility, horizontal scaling.
* **Bad:** No ACID compliance across collections, limiting data integrity.

## More Information

For additional details, see the database performance evaluation [here](link-to-evaluation).