# Lilly Grella - Data Engineering Systems Individual Project 2
This project performs ETL operations using rust on a sqlite database. I used github copilot to help transform my previous python code into rust code, improve some of my error catching and simplify my syntax. I found using a combination of copilot and code whisperer helped make my code simpler than I initially thought it could be.

## Youtube Link:

https://www.youtube.com/watch?v=Bqp6jhXpWPc

## Process:
1. First, I extract the data from github's dataset page and create a csv in the data folder.
     * The `extract` function performs this operation
2. Next, I turn the csv file from my data folder into a formal sqlite database
     * The `transform_load` function performs this operation
3. Finally, I am able to perform CRUD operations on the sqlite table, which is outputted as a log.
     * the `query` function, along with more specific CRUD functions, perform this operation.

The `log_query` function logs all the queries performed in a .md file for tracking and transparency.

## Specific Operations:
1. Run Codespaces or clone github repo
2. Build dependencies (run: cargo build)
3. Extract the data from the original site (run: make extract)
* Output: ![extract](/data/make_extract.png)
4. Transform and Load the data into a sqlite database (run: make transform_load)
* Output: ![tl](/data/m_transform_load.png)
5. Query the data (sample queries can be run using make commands. Otherwise, from the command line run: cargo run query 'your query' to run your own query on the table)
* Make Create: ![m_create](/data/m_create.png)
* Make Read: ![m_read](/data/m_read.png)
* Make Update: ![m_update](/data/m_update.png)
* Make Delete: ![m_delete](/data/m_delete.png)
* General Query: ![cargo_query](/data/cargo_query.png)

## Continuous Integration:
To confirm code formatting, style and testing:
* `make test`
* `make lint`
* `make format`

Additionally, with every commit, github actions generates an optimized Rust binary as a GitHub Actions artifact that can be downloaded. That can be found by selecting the latest run and scrolling to the bottom. 

Example of Log: 
![extract](/data/query_log.png)

## References

* [rust-cli-template](https://github.com/kbknapp/rust-cli-template)
