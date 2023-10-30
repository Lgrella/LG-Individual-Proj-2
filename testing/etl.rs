use LG_sqlite::{extract, query, transform_load};

#[test]
fn test_extract() {
    let url =
        "https://github.com/datasets/five-thirty-eight-datasets/blob/master/datasets/alcohol-consumption/data/drinks.csv?raw=true";
    let file_path = "data/drinks.csv";
    let directory = "data";
    extract(url, file_path, directory);
    assert!(std::fs::metadata(file_path).is_ok());
}

#[test]
fn test_transform_load() {
    let dataset = "data/drinks.csv";
    let result = transform_load(dataset);

    assert_eq!(result.unwrap(), "alcbycountry.db");
}

#[test]
fn test_query() {
    // Execute a SELECT query
    let select_query = "SELECT * FROM alcbycountry WHERE id = 9;";
    let result = query(select_query);

    assert!(result.is_ok());
}
