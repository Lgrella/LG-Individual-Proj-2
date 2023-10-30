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

install:
	#install if needed

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
	cargo run query "INSERT INTO alcbycountry (country, beer_servings, spirit_servings, wine_servings, total_liters) VALUES ('TEST', 10, 20, 0, 15);"

# Example: Read from the database
read:
	cargo run query "SELECT * FROM alcbycountry WHERE country = 'belize';"

# Example: Update a database entry
update:
	cargo run query "UPDATE alcbycountry SET country='Afghanistan', beer_servings=100, spirit_servings=30, wine_servings = 1, total_liters=15 WHERE id=1;"

# Example: Delete a database entry
delete:
	cargo run query "DELETE FROM alcbycountry WHERE id=3;"

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
