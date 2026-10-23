# Celestial Bodies Database

This repository contains the PostgreSQL database dump.

## Database Structure

The `universe` database contains 5 tables with relational links (Primary & Foreign Keys):

- **`galaxy`**: Information about galaxies (e.g., Milky Way, Andromeda).
- **`star`**: Information about stars linked to their respective galaxies.
- **`planet`**: Information about planets linked to their host stars.
- **`moon`**: Natural and theoretical satellites linked to their respective planets.
- **`planet_type`**: Classification types for planets (Terrestrial, Gas Giant, Ice Giant).

## How to Rebuild the Database

To restore the database from the SQL dump, execute the following command in a terminal where PostgreSQL is installed:

```bash
psql -U postgres < universe.sql
