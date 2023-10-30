rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version 			#rust compiler
	cargo --version 			#rust package manager
	rustfmt --version			#rust code formatter
	rustup --version			#rust toolchain manager
	clippy-driver --version		#rust linter

format:
	cargo fmt --quiet

lint:
	cargo clippy --quiet

test:
	cargo test --quiet

run:
	cargo run

release:
	cargo build --release

all: format lint test run

#additional commands

# Example: Extract data
extract: 
	cargo run extract

# Example: Transform and Load data
transform_load:
	cargo run transform_load

# Example: Create a database entry
create:
	cargo run query "INSERT INTO employeesDB (employee, position, salary, fulltime, startdate, storenum) VALUES ('Aly Grella', 'Bartender', 25.00, 0, '2023-09-01', 1);"

# Example: Read from the database
read:
	cargo run query "SELECT * FROM employeesDB WHERE employee = 'Aly Grella';"

# Example: Update a database entry
update:
	cargo run query "UPDATE employeesDB SET employee='John Doe', position='FOH', salary=30, fulltime = 1, day='2023-10-23', storenum=2 WHERE id=1;"

# Example: Delete a database entry
delete:
	cargo run query "DELETE FROM employeesDB WHERE id=3;"

# Generate and push changes to GitHub
generate_and_push:
	@if [ -n "$$(git status --porcelain)" ]; then \
		git config --local user.email "action@github.com"; \
		git config --local user.name "GitHub Action"; \
		git add .; \
		git commit -m "Add query log"; \
		git push; \
	else \
		echo "No changes to commit. Skipping commit and push."; \
	fi
