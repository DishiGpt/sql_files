# sql_files

A collection of MySQL exercises I completed while learning SQL. Each file is an independent SQL problem, example, or solution intended for practice and reference.

## Table of contents
- [About](#about)
- [Repository layout](#repository-layout)
- [Prerequisites](#prerequisites)
- [Quickstart (Docker)](#quickstart-docker)
- [Run a single SQL file](#run-a-single-sql-file)
- [Run all SQL files in a directory](#run-all-sql-files-in-a-directory)
- [Testing / Iterating on queries](#testing--iterating-on-queries)
- [Conventions and tips](#conventions-and-tips)
- [Ideas to improve this repo](#ideas-to-improve-this-repo)
- [Contributing](#contributing)
- [License](#license)

## About
This repo holds SQL problems, example schemas, and solutions — useful when practicing MySQL fundamentals (SELECT, JOINs, GROUP BY, WINDOW functions, DDL, DML, indexes, etc.). Files are plain `.sql` so they can be loaded into any local MySQL instance.

## Repository layout
A recommended structure (you may already have something similar):

- problems/           — SQL problem statements and starter files
- solutions/          — completed solutions (one per problem)
- fixtures/           — sample data and seed scripts (CREATE TABLE, INSERT)
- migrations/         — schema-only migration files if you want to reproduce schema
- README.md           — this file
- scripts/            — helper scripts (run-all, run-one, etc.)

If your repo currently mixes files, consider grouping them into the folders above.

## Prerequisites
- Docker (recommended) or a local MySQL 8+ installation
- mysql client (optional, for connecting directly)

## Quickstart (Docker)
The easiest way to run and experiment with these SQL files is with Docker.

Start a MySQL container:

```bash
docker run --name sql-dev \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -e MYSQL_DATABASE=exercises \
  -p 3306:3306 \
  -d mysql:8.0
```

Wait a few seconds for MySQL to initialize. To connect with the mysql client from another container:

```bash
docker run -it --rm --network host mysql:8.0 mysql -h127.0.0.1 -P3306 -uroot -prootpass exercises
```

(If your Docker setup does not support `--network host` on macOS/Windows, use `docker exec -it sql-dev mysql -uroot -prootpass exercises`.)

### Docker Compose example
Create a simple `docker-compose.yml`:

```yaml
version: "3.8"
services:
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: exercises
    ports:
      - "3306:3306"
    volumes:
      - ./fixtures:/docker-entrypoint-initdb.d:ro
```

Place seed files in `fixtures/`; containers will execute them on first start.

## Run a single SQL file
If the container is named `sql-dev` and your host has `file.sql`:

```bash
# from host: run the SQL against the 'exercises' database
docker exec -i sql-dev mysql -uroot -prootpass exercises < path/to/file.sql

# OR, using cat and piping
cat path/to/file.sql | docker exec -i sql-dev mysql -uroot -prootpass exercises
```

If using a local MySQL (without Docker):

```bash
mysql -h 127.0.0.1 -P 3306 -u root -p exercises < path/to/file.sql
```

## Run all SQL files in a directory
From the host (bash):

```bash
for f in ./problems/*.sql; do
  echo "Running $f"
  docker exec -i sql-dev mysql -uroot -prootpass exercises < "$f"
done
```

Or use a single concatenated run (careful about ordering and transactions):

```bash
cat ./fixtures/*.sql ./migrations/*.sql | docker exec -i sql-dev mysql -uroot -prootpass exercises
```

## Testing / Iterating on queries
- Keep seed data small and representative so queries return readable results.
- Use `SELECT * FROM table LIMIT 20;` to inspect data.
- Use `EXPLAIN` before complex SELECTs to check indexes and plan:
  ```sql
  EXPLAIN SELECT ...
  ```
- Wrap destructive experiments in transactions:
  ```sql
  START TRANSACTION;
  -- DML you want to try
  ROLLBACK; -- or COMMIT;
  ```

## Conventions and tips
- Filename pattern: NN-short-title.sql (e.g., 01-create-schema.sql, 02-joins-basic.sql)
- Separate data seeds and solutions:
  - `fixtures/01-schema.sql`
  - `fixtures/02-data.sql`
  - `problems/01-joins.sql`
  - `solutions/01-joins.sql`
- Include a brief comment header in each file describing the goal:
  ```sql
  -- 03-top-customers.sql
  -- Goal: Return top 5 customers by total spent in 2024.
  ```
- Prefer idempotent DDL for easy re-runs:
  ```sql
  DROP TABLE IF EXISTS users;
  CREATE TABLE users (...);
  ```
- Tag files or add a small YAML/JSON index if you want metadata (difficulty, topics, runtime).

## Ideas to improve this repo
- Add a top-level `index.json` or `index.yml` listing each exercise with tags (difficulty, topics).
- Add a `Makefile` or simple shell scripts:
  - `scripts/run-all.sh`
  - `scripts/run-problem.sh <file>`
- Add test assertions using a small test harness (e.g., run a query and diff results against expected CSV).
- Provide a Docker Compose dev environment with a web-based SQL client (Adminer or phpMyAdmin) for easier inspection.
- Add CI checks (GitHub Actions) that spin up MySQL, run fixtures, and validate that solutions run without errors.

## Contributing
If you want to add more problems or improve existing ones:
- Follow the filename conventions above.
- Add fixtures that are small and self-contained.
- Include problem descriptions and expected outputs (in comments or a companion file).
- Open a pull request; describe what the new SQL file demonstrates and any assumptions.

## Example: Adding Adminer (optional)
You can add Adminer to docker-compose for a simple web UI:

```yaml
services:
  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080
```

Then browse http://localhost:8080 and connect to the MySQL service.

## License
This repository is for personal learning. Add a license file if you plan to share or allow reuse (e.g., MIT).

---

If you want, I can:
- Create this README.md in your repository.
- Generate a starter `docker-compose.yml` and small `fixtures/` seed file.
- Reorganize your existing SQL files into the recommended folder structure and add an index.

Which of those would you like me to do next?
